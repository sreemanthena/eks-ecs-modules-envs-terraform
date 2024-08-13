variable "cluster_name" {
  type        = string
  description = "Name of the EKS cluster"
}

variable "region" {
  type        = string
  description = "AWS Region"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID"
}

variable "subnet_ids" {
  type        = list(string)
  description = "List of subnet IDs"
}

variable "instance_type" {
  type        = string
  description = "EC2 instance type for the EKS node group"
}

variable "desired_capacity" {
  type        = number
  description = "Desired number of nodes"
}

variable "min_size" {
  type        = number
  description = "Minimum number of nodes"
}

variable "max_size" {
  type        = number
  description = "Maximum number of nodes"
}

variable "cluster_version" {
  type        = string
  description = "Mention the eks version"
  default     = "1.29"
}

variable "security_group_ids" {
  type        = list(string)
  description = "List of security group IDs for the node group"
}

variable "node_group_name" {
  type        = string
  description = "The name of the EKS node group"
}

variable "ec2_ssh_key" {
  type = string
  description = "The Pem key to login servers"
}


