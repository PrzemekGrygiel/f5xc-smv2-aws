module "aws-node" {
  count                     = 1
  source                    = "./aws"
  f5xc_cluster_name         = var.f5xc_cluster_name
  master_node_count         = var.master_node_count
  worker_node_count         = var.worker_node_count
  ssh_public_key            = var.ssh_public_key
  aws_availability_zones    = var.aws_availability_zones
  aws_instance_type         = var.aws_instance_type
  aws_ami_id                = var.aws_ami_id
  aws_vpc_name              = format("%s-vpc", var.f5xc_cluster_name)
  aws_vpc_cidr              = var.aws_vpc_cidr
  aws_subnet_slo            = var.aws_subnet_slo
  aws_subnet_sli            = var.aws_subnet_sli
  aws_sg_allow_slo_traffic  = var.aws_sg_allow_slo_traffic
  aws_sg_allow_sli_traffic  = var.aws_sg_allow_sli_traffic
  f5xc_registration_token   = terraform_data.token.input

  # tags
  aws_owner_tag             = var.aws_owner_tag
  aws_useremail_tag         = var.aws_useremail_tag
  aws_environment_tag       = var.aws_environment_tag
  aws_costcenter_tag        = var.aws_costcenter_tag
  aws_manageremail_tag      = var.aws_manageremail_tag
  aws_team_tag              = var.aws_manageremail_tag
}
