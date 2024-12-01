module "my_vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 5.13.0"

# Vpc Basic Details

  name = "vpc_dev"
  cidr = "10.0.0.0/16"

  azs                 = ["us-east-2a" , "us-east-2b"]
  private_subnets     = ["10.0.1.0/24" , "10.0.2.0/24"]
  public_subnets      = ["10.0.3.0/24" , "10.0.4.0/24"]

  # Database Subnets
  create_database_subnet_group = true
  create_database_subnet_route_table = true
  database_subnets    = ["10.0.101.0/24" , "10.0.102.0/24"]
# create_database_nat_gateway_route = true
# create_database_internet_gateway_route = true

# Nat gateway for outbound communication off
enable_nat_gateway = true
single_nat_gateway = true


#Vpc Dns Parameter
enable_dns_hostnames = true
enable_dns_support   = true

public_subnet_tags ={
   Name = "public_subnets"
}

private_subnet_tags = {
  Name = "private_subnets"
}

database_subnet_tags = {
    Name = "database_subnets"
}
tags = {
    Owner = "Harsh"
    Enviornment = "dev"
}

vpc_tags = {
    Name = "vpc-dev"
} 
}