module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "${var.vpc_name}-${local.Name}"
  cidr = var.vpc_cidr_block

  azs             = var.avl_zs
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets

  # Database Subnets
  database_subnets                   = var.database_subnets
  create_database_subnet_group       = var.create_database_subnet_group
  create_database_subnet_route_table = var.create_database_subnet_route_table
  # create_database_internet_gateway_route = true
  # create_database_nat_gateway_route = true

  enable_dns_hostnames = true
  enable_dns_support   = true

  enable_nat_gateway = var.enable_nat_gateway
  single_nat_gateway = var.single_nat_gateway

  public_subnet_tags = {
    Type = "public subnets ${local.Name}"
  }
  private_subnet_tags = {
    Type = "private subnets ${local.Name}"
  }
  database_subnet_tags = {
    Type = "database subnets ${local.Name}"
  }

  tags = local.common_tags
}