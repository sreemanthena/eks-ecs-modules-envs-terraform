terraform {
  backend "s3" {
    bucket = "sree-ecs-tfstate"
    key    = "ecs/env/${terraform.workspace}/terraform.tfstate"
    region = "us-east-1" 
  }
}
