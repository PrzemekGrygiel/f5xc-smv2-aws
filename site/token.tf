resource "null_resource" "wait_after_site" {
  provisioner "local-exec" {
    command = "sleep 10"
  }

  triggers = {
    site_complete = restapi_object.site.id
  }
}

resource "restapi_object" "token" {
  depends_on  = [null_resource.wait_after_site]
  id_attribute = "metadata/name"
  path         = "/register/namespaces/system/tokens"
  data         = jsonencode({
    "metadata": {
      "name": var.f5xc_cluster_name,
      "namespace": "system"
    }
    "spec": {
      "type": "JWT",
      "site_name": var.f5xc_cluster_name
    }
  })
}

resource "terraform_data" "token" {
  input      = regex("content:(\\S+)", restapi_object.token.api_data.spec)[0]
}

output "token" {
  value = terraform_data.token.input
}
