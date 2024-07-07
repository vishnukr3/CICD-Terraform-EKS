terraform {
  backend "s3" {
    bucket = "mytodoappbucket3"
    key    = "eks/terraform.tfstate"
    region = "us-east-2"
  }
}