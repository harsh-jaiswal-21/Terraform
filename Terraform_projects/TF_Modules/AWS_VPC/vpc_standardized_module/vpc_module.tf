module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.13.0"

  name = "${local.name}-${var.vpc_name}" 
  cidr = var.cidr_blk

  azs             = var.azones
  public_subnets  = var.pub_sub
  private_subnets = var.pvt_sub


  database_subnets                   = var.db_sub
  create_database_subnet_group       = var.create_database_subnet_group
  create_database_subnet_route_table = var.create_database_subnet_route_table
  # create_database_nat_gateway_route =
  # create_database_internet_gateway_route =

  enable_nat_gateway = var.enable_nat_gateway
  single_nat_gateway = var.single_nat_gateway

  enable_dns_hostnames = true
  enable_dns_support   = true

  public_subnet_tags = {
    Type = "public_subnet"
  }
  private_subnet_tags = {
    Type = "private_subnet"
  }
  database_subnet_tags = {
    Type = "database_subnet"
  }

  vpc_tags = local.common_tags
  tags     = local.common_tags


}