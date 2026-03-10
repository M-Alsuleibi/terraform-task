module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "6.6.0"

  name = "dev-vpc"
  cidr = "10.2.0.0/16"

  azs                 = ["us-east-1a"]
  public_subnets      = ["10.2.1.0/24"]
  public_subnet_names = ["dev-public-subnet-1"]

  map_public_ip_on_launch = true

  tags = {
    Environment = "dev"
  }

}