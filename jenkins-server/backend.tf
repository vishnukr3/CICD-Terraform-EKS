terraform {
  backend "s3" {
    bucket = "mytodoappbucket3"
    key    = "jenkins/terraform.tfstate"
    region = "us-east-2"
  }
}