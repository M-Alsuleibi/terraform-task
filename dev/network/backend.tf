terraform {
  backend "s3" {
    bucket         = "terraform-task-v1-tfstate-bucket"
    key            = "dev/network/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}