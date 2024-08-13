output "cluster_id" {
  value = aws_eks_cluster.my_cluster.id
}

output "node_group_id" {
  value = aws_eks_node_group.my_node_group.id
}
