module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "6.6.0"

  name = "terraform-dev-vpc"
  cidr = "10.2.0.0/16"

  azs            = ["us-east-1a"]
  public_subnets = ["10.2.1.0/24"]

  map_public_ip_on_launch = true

  tags = {
    Environment = "dev"
  }

  public_subnet_tags = {
    Name = "terraform-dev-public-subnet-1"
  }
}