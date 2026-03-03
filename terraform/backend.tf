terraform {
  backend "s3" {
    bucket         = "devops-terraform-state-sudheesh"
    key            = "global/s3/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}