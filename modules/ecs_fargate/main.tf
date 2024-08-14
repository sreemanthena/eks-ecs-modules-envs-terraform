resource "aws_ecs_cluster" "fargate_cluster" {
  name = var.ecs_cluster_name
}

##### Below is to create Task Execution Role######
# Create ECS Task Execution Role
resource "aws_iam_role" "ecs_task_execution_role" {
  name = "ecs_task_execution_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "ecs-tasks.amazonaws.com"
        }
      }
    ]
  })
}

# Attach the necessary policies to the role
resource "aws_iam_role_policy_attachment" "ecs_task_execution_role_policy_attachment" {
  role       = aws_iam_role.ecs_task_execution_role.id
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}
############################################
####Below is task definition steps####
resource "aws_ecs_task_definition" "fargate_task" {
  family                   = "my-task-family"
  network_mode             = "awsvpc"
  execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn
  task_role_arn            = aws_iam_role.ecs_task_execution_role.arn
  requires_compatibilities = ["FARGATE"]
  cpu                      = "256"
  memory                   = "512"

  container_definitions    = <<DEFINITION
[{
  "name": "my-container",
  "image": "my-docker-image",
  "cpu": 256,
  "memory": 512,
  "essential": true,
  "portMappings": [{
    "containerPort": 80,
    "hostPort": 80
  }],
  "logConfiguration": {
    "logDriver": "awslogs",
    "options": {
      "awslogs-group": "/ecs/my-task",
      "awslogs-region": "us-west-2",
      "awslogs-stream-prefix": "ecs"
    }
  }
}]
DEFINITION
}

# resource "aws_ecs_task_definition" "fargate_task" {
#   family                   = var.task_family
#   network_mode             = "awsvpc"
#   requires_compatibilities = ["FARGATE"]
#   cpu                      = var.task_cpu
#   memory                   = var.task_memory
#   execution_role_arn       = var.task_execution_role_arn

#   container_definitions = jsonencode([
#     {
#       name      = var.container_name
#       image     = var.container_image
#       essential = true
#       portMappings = [
#         {
#           containerPort = var.container_port
#           hostPort      = var.container_port
#         }
#       ]
#       //environment = var.container_env_vars
#     }
#   ])
# }
#############################
resource "aws_ecs_service" "fargate_service" {
  name            = var.service_name
  cluster         = aws_ecs_cluster.fargate_cluster.id
  task_definition = aws_ecs_task_definition.fargate_task.arn
  desired_count   = var.service_desired_count

  launch_type = "FARGATE"

  network_configuration {
    subnets         = var.subnet_ids
    security_groups = var.security_group_ids
    assign_public_ip = true
  }

  depends_on = [
    aws_ecs_task_definition.fargate_task,
  ]
}