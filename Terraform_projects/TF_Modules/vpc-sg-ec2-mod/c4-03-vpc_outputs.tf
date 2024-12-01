output "vpc_cidr_block" {
  description = "The CIDR block of the VPC"
  value       = module.vpc.vpc_cidr_block
}
output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
}
output "public_subnets" {
  description = "List Public Subnets"
  value       = module.vpc.public_subnets
}
output "private_subnets" {
  description = "List of IDs of private subnets"
  value       = module.vpc.private_subnets
}
output "database_subnets" {
  description = "Database subnets list"
  value       = module.vpc.database_subnets
}
output "availablity_zones" {
  description = "shows list of azs used in this module"
  value       = module.vpc.azs
}
output "nat_public_ip" {
  description = "shows  elstic ip used in nat gateway"
  value       = module.vpc.nat_public_ips
}
output "region" {
  value = var.aws_region # bakchodi 
}