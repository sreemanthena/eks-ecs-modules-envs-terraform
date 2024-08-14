######Below is the code for EKS reference###
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

######Below is the code for ECS reference###
variable "ecs_cluster_name" {}
#variable "region" {}
variable "task_family" {}
variable "task_cpu" {}
variable "task_memory" {}
variable "task_execution_role_arn" {}
variable "container_name" {} 
variable "container_image" {}
variable "container_port" {}
variable "service_name" {}
variable "service_desired_count" {}
#variable "vpc_id" {}
#variable "subnet_ids" {}
#variable "security_group_ids" {}
module "ecs" {
  source        = "../../modules/ecs_fargate"

  ecs_cluster_name  = var.ecs_cluster_name
  task_family       = var.task_family
  task_cpu          = var.task_cpu
  task_memory       = var.task_memory
  task_execution_role_arn = var.task_execution_role_arn
  container_name    = var.container_name
  container_image   = var.container_image
  container_port    = var.container_port
  service_name      = var.service_name
  service_desired_count = var.service_desired_count
  vpc_id        = var.vpc_id
  subnet_ids    = var.subnet_ids
  security_group_ids = var.security_group_ids
  
}