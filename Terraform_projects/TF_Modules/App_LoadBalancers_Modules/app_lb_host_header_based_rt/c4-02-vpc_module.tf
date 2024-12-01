module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.14.0"

  name = "my-vpc-${local.name}"
  cidr = var.vpc_cidr

  azs             = var.azs
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets

  # Database Subnets 
  database_subnets                   = var.database_subnets
  create_database_subnet_route_table = var.create_database_subnet_route_table
  create_database_subnet_group       = var.create_database_subnet_group
  # create_database_internet_gateway_route  =  

  enable_dns_hostnames = true
  enable_dns_support   = true

  enable_nat_gateway = var.enable_nat_gateway
  single_nat_gateway = var.single_nat_gateway

  public_subnet_tags = {
    Type = "public_subnet"
  }
  private_subnet_tags = {
    Type = "private_subnet"
  }
  database_subnet_tags = {
    Type = "database_subnet"
  }

  tags = local.common_tags
}