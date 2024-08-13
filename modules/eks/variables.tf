variable "cluster_name" {
  type        = string
  description = "Name of the EKS cluster"
}

variable "subnet_ids" {
  type        = list(string)
  description = "List of subnet IDs for EKS cluster"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID where the cluster and other resources will be created"
}
