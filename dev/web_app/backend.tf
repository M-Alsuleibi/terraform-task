terraform {
  backend "s3" {
    bucket         = "terraform-task-v1-tfstate-bucket"
    key            = "dev/web_app/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}