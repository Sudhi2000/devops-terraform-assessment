terraform {
  backend "s3" {
    bucket         = "devops-terraform-state-sudheesh"
    key            = "env/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}