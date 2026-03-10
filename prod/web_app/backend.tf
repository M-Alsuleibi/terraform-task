terraform {
  backend "s3" {
    bucket         = "terraform-task-v1-tfstate-bucket"
    key            = "prod/web_app/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}