terraform {
    required_version = ">= 1.6.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.35.1"
    }
     http = {
      source  = "hashicorp/http"
      version = "3.5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}
