module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "6.6.0"

  name = "prod-vpc"
  cidr = "10.1.0.0/16"

  azs                 = ["us-east-1a", "us-east-1b"]
  public_subnets      = ["10.1.1.0/24", "10.1.2.0/24"]
  public_subnet_names = ["prod-public-subnet-1", "prod-public-subnet-2"]

  map_public_ip_on_launch = true

  tags = {
    Environment = "prod"
  }
}