terraform {
  backend "s3" {
    bucket = "sree-terraform"
    key    = "dev-eks/terraform.tfstate"
    region = "us-east-1" 
  }
}
