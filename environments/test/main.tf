variable "cluster_name" {}
variable "cluster_version" {}
variable "region" {}
variable "vpc_id" {}
variable "subnet_ids" {}
variable "security_group_ids" {}
variable "instance_type" {}
variable "desired_capacity" {}
variable "min_size" {}
variable "max_size" {}
variable "ec2_ssh_key" {}
variable "node_group_name" {}

module "eks" {
  source = "../../modules/eks"

  cluster_name       = var.cluster_name
  cluster_version    = var.cluster_version
  region             = var.region
  vpc_id             = var.vpc_id
  subnet_ids         = var.subnet_ids
  security_group_ids = var.security_group_ids
  instance_type      = var.instance_type
  desired_capacity   = var.desired_capacity
  min_size           = var.min_size
  max_size           = var.max_size
  ec2_ssh_key        = var.ec2_ssh_key
  node_group_name    = var.node_group_name
}
