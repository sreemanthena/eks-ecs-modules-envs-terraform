terraform {
  backend "s3" {
    bucket = "org-terraform-states"
    key    = "dev/terraform.tfstate"
    region = "us-east-1" 
  }
}
