output "vpc_cidr_block" {
    value = module.vpc.vpc_cidr_block
    description = "The CIDR block of the VPC"
}
output "vpc_id" {
    value = module.vpc.vpc_id
    description = "The ID of the VPC"
}
output "private_subnets" {
  description = "List of IDs of private subnets"
  value       = module.vpc.private_subnets
}
output "db_subnets" {
    value = module.vpc.database_subnets
    description = "list of db subnets"
}
output "public_subnets" {
    value = module.vpc.public_subnets
    description = "list of public subnets"
}
output "avl_zones" {
    value = module.vpc.azs
    description = "List of AZS"
}
output "nat_gw_public_ip" {
    value = module.vpc.nat_public_ips
    description = "nat gateway public ip"
}
output "vpc_name" {
    value = module.vpc.name
    description = "vpc name"
}