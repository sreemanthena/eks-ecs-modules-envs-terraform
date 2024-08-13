terraform {
  backend "s3" {
    bucket = "vantiva-terraform-states"
    key    = "test/terraform.tfstate"
    region = "us-east-1" 
  }
}
