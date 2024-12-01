module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.13.0"
  name    = local.name

  cidr            = var.vpc_cidr_block
  azs             = var.azones
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets

  # database subnets configuration 

  database_subnets                   = var.database_subnets
  create_database_subnet_group       = var.database_subnet_group
  create_database_subnet_route_table = var.database_subnet_route_table
  # create_database_internet_gateway_route = 
  # create_database_nat_gateway_route = 

  enable_dns_hostnames = true
  enable_dns_support   = true

  enable_nat_gateway = var.enable_nat_gateway
  single_nat_gateway = var.single_nat_gateway

  public_subnet_tags = {
    Type = "public_subnet_tags"
  }
  private_subnet_tags = {
    Type = "private_subnet_tags"
  }
  database_subnet_tags = {
    Type = "database_subnet_tags"
  }

  tags = local.common_tags
}