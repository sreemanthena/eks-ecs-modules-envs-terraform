variable "ecs_cluster_name" {
  type        = string
  description = "Name of the ECS cluster"
}

variable "task_family" {
  type        = string
  description = "Family name of the task definition"
}

variable "task_cpu" {
  type        = string
  description = "The amount of CPU used by the task"
}

variable "task_memory" {
  type        = string
  description = "The amount of memory used by the task"
}

variable "task_execution_role_arn" {
  type        = string
  description = "IAM role ARN that the ECS tasks assume"
}

variable "container_name" {
  type        = string
  description = "Name of the container in the task"
}

variable "container_image" {
  type        = string
  description = "Image URL of the container"
}

variable "container_port" {
  type        = number
  description = "Port on which the container will listen"
}

# variable "container_env_vars" {
#   type        = list(map(string))
#   description = "Environment variables for the container"
# }

variable "service_name" {
  type        = string
  description = "ECS service name"
}

variable "service_desired_count" {
  type        = number
  description = "Number of instances of the task definition to place and keep running"
}

variable "subnet_ids" {
  type        = list(string)
  description = "List of subnet IDs for the service"
}

variable "security_group_ids" {
  type        = list(string)
  description = "List of security group IDs for the service"
}