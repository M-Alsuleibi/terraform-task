data "terraform_remote_state" "shared" {
  backend = "s3"

  config = {
    bucket = "terraform-task-v1-tfstate-bucket"
    key    = "shared/terraform.tfstate"
    region = "us-east-1"
  }
}

data "terraform_remote_state" "network" {
  backend = "s3"

  config = {
    bucket = "terraform-task-v1-tfstate-bucket"
    key    = "prod/network/terraform.tfstate"
    region = "us-east-1"
  }
}

data "http" "my_ip" {
  url = "https://checkip.amazonaws.com"
}