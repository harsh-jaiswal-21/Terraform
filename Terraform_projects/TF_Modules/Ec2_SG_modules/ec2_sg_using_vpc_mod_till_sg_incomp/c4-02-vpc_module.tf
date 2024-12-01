module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 5.13.0"

  name = local.name
  cidr = var.cidr
  azs = var.avl_zones

  public_subnets = var.public_subnets
  private_subnets = var.private_subnets

  database_subnets = var.database_subnets
  create_database_subnet_group = var.create_database_subnet_group
  create_database_subnet_route_table = var.create_database_subnet_route_table
# create_database_nat_gateway_route =
# create_database_internet_gateway_route =

enable_nat_gateway = var.enable_nat_gateway
single_nat_gateway = var.single_nat_gateway


enable_dns_hostnames = true
enable_dns_support   = true

public_subnet_tags = {
    Type = "public_subnets"
}

private_subnet_tags = {
    Type = "private_subnets"
}

database_subnet_tags = {
    Type = "database_subnets"
}

vpc_tags = local.common_tags
tags = local.common_tags
}