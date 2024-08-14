####EKS-Values######
cluster_name       = "dev-eks"
region             = "us-east-1"
vpc_id             = "vpc-02a14c26c38857594"
subnet_ids         = ["subnet-0e89b68055d46ce1a", "subnet-0482f14f5fcd95d89"]
security_group_ids = ["sg-002e49f08bf28720e"]
instance_type      = "t2.small"
desired_capacity   = 2
min_size           = 1
max_size           = 4
cluster_version    = "1.29"
ec2_ssh_key        = "jenkins-nonprod"
node_group_name    = "dev-eks-node-group"


###ECS-Values####
ecs_cluster_name       = "dev-ecs-cluster"
task_family            = "dev-web-app"
task_cpu               = "256"
task_memory            = "512"
task_execution_role_arn = "arn:aws:iam::12344444:role/task-exec-role"
container_name         = "web-app"
container_image        = "nginx:latest"
container_port         = 80
service_name           = "web-app-service"
service_desired_count  = 2