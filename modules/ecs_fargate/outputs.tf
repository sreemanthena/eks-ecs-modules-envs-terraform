output "cluster_id" {
  value = aws_ecs_cluster.fargate_cluster.id
}

output "service_id" {
  value = aws_ecs_service.fargate_service.id
}