terraform {
  required_version = ">= 1.6.0"

  required_providers {
    tls = {
      source  = "hashicorp/tls"
      version = "4.2.1"
    }
   
    aws = {
      source  = "hashicorp/aws"
      version = "6.35.1"
    }
  }
}

provider "aws" {
  region = "us-east-1"

  default_tags {
    tags = {
      ManagedBy = "M-Alsuleibi/terraform-task"
    }
  }
}
