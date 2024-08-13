module "eks" {
  source      = "../../modules/eks"
  cluster_name = var.cluster_name
  subnet_ids   = var.subnet_ids
  vpc_id       = var.vpc_id
}

module "ecs" {
  source        = "../../modules/ecs"
  cluster_name  = var.ecs_cluster_name
  subnet_ids    = var.subnet_ids
  vpc_id        = var.vpc_id
}
