resource "random_string" "rnd" {
  length  = 5
  upper   = false
  lower   = true
  special = false
  numeric = false
}
module "aws" {
  count                     = var.aws_site_count
  source                    = "./site"
  f5xc_cluster_name         = format("%s-aws-%d-%s", var.project_prefix, count.index, random_string.rnd.result )
  secure_mesh_site_provider = "aws"
  aws_instance_type         = "t3a.2xlarge"
  aws_availability_zones    = var.aws_availability_zones
  aws_ami_id                = data.aws_ami_ids.smsv2.ids[0]

  aws_subnet_slo            = aws_subnet.slo[*].id
  aws_subnet_sli            = aws_subnet.sli[*].id
  aws_sg_allow_slo_traffic  = resource.aws_security_group.allow_slo_traffic.id
  aws_sg_allow_sli_traffic  = resource.aws_security_group.allow_sli_traffic.id
  master_node_count         = var.master_node_count
  worker_node_count         = var.worker_node_count

  ssh_public_key            = var.ssh_public_key
  aws_owner_tag             = var.aws_owner_tag
  aws_useremail_tag         = var.aws_useremail_tag
  aws_environment_tag       = var.aws_environment_tag
  aws_costcenter_tag        = var.aws_costcenter_tag
  aws_manageremail_tag      = var.aws_manageremail_tag
  aws_team_tag              = var.aws_team_tag

  f5xc_tenant               = var.f5xc_tenant
  f5xc_api_url              = var.f5xc_api_url
  f5xc_api_token            = var.f5xc_api_token
}
