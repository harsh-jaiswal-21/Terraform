output "vpc_name" {
    description = "printing vpc's name"
    value = module.vpc.name
}
output "pub_subnet" {
    value = module.vpc.public_subnets
    description = "printing public subnets"
}
output "pvt_subnet" {
    value = module.vpc.private_subnets
    description = "printing public subnets"
}
output "database_subnet" {
    value = module.vpc.database_subnets
    description = "printing public subnets"
}
output "vpc_id" {
    value = module.vpc.vpc_id
    description = "printing vpc id"
}
output "nat" {
    value = module.vpc.nat_public_ips
    description = "List of public Elastic IPs created for AWS NAT Gateway"
}
output "avaliblity_zones" {
    value = module.vpc.azs
    description = "lists availablity zones"
}
output "vpc_cidr_block" {
    value = module.vpc.vpc_cidr_block
    description = "prints cidr block of vpc"
}