variable "f5xc_cluster_name" {}
variable "f5xc_registration_token" {}
variable tmm_interfaces {
  type = list(string)
  description = "List of interface names for the TMM configuration."
}
variable "ssh_public_key" {}
variable "master_node_count" {
  type = number
  default = 0
}
variable "worker_node_count" {
  type = number
  default = 0
}
variable "http_proxy" {
  type = string
  default = ""
}
variable "outside_network" {
  type = string
  default = "vmbr0"
}
variable "slo_interface" {
  type = string
  default = "eth0"
}
variable "outside_network_vlan" {
  type = number
  default = -1
}
variable "sli_interface" {
  type = string
  default = ""
}
variable "inside_network" {
  type = string
  default = ""
}
variable "inside_network_vlan" {
  type = number
  default = -1
}
variable "inside_ipv4_prefix" {
  type = string
  default = "192.168.100.0/24"
}
variable "inside_dhcp_pool_start" {
  type = string
  default = "192.168.100.10"
}
variable "inside_dhcp_pool_end" {
  type = string
  default = "192.168.100.200"
}
variable "outside_macaddr" {
  type    = string
  default = ""
}
variable "inside_vip" {
  type  = string
  default = ""
}
variable "master_vm_size" {
  type = string
  default = "50G"
}
variable "worker_vm_size" {
  type = string
  default = "50G"
}
variable "slo_global_vn" {
  type = string
  default = ""
}

# AWS

variable "aws_vpc_name" {}
variable "aws_vpc_cidr" {}
variable "aws_owner_tag" {}

variable "aws_subnet_slo" {
  type = list(string)
}
variable "aws_subnet_sli" {
  type = list(string)
}
variable "aws_subnet_ext" {
  type = list(string)
}
variable "aws_subnet_int" {
  type = list(string)
}
variable "aws_sg_allow_slo_traffic" {
  type = string
}
variable "aws_sg_allow_sli_traffic" {
  type = string
}
variable "aws_availability_zones" {
  type = list(string)
}
variable "aws_ami_id" {}
variable "aws_instance_type" {
  type = string
  default = "t3.xlarge"
}
variable "ec2_disk_size" {
  type    = number
  default = 80
}
