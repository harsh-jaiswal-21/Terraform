output "vpc_name" {
  value       = module.vpc.name
  description = "prints vpc name"
}
output "vpc_id" {
  value       = module.vpc.vpc_id
  description = "prints vpc id"
}
output "public_subnets" {
  description = "List of IDs of public subnets"
  value       = module.vpc.public_subnets
}
output "private_subnets" {
  description = "List of IDs of private subnets"
  value       = module.vpc.private_subnets
}
output "database_subnets" {
  description = "List of IDs of database subnets"
  value       = module.vpc.database_subnets
}
output "nat_public-ips" {
  value = module.vpc.nat_public_ips
}
output "azs" {
  value       = module.vpc.azs
  description = "list of availablity zones"
}
output "vpc_cidr" {
  value = module.vpc.vpc_cidr_block
  description = "cidr block of vpc"
}