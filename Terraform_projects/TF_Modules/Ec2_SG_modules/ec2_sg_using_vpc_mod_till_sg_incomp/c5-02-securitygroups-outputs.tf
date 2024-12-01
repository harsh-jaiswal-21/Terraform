# Public Sg Outputs
output "public_group_id" {
  description = "The ID of the security group"
  value       = module.public_sec_group.security_group_id
}

output "public_group_vpc_id" {
  description = "The VPC ID"
  value       = module.public_sec_group.security_group_vpc_id
}


output "public_group_name" {
  description = "The name of the security group"
  value       = module.public_sec_group.security_group_name
}

# Private Sg Outputs
output "security_group_id" {
  description = "The ID of the security group"
  value       = module.private_sec_group.security_group_id
}

output "security_group_vpc_id" {
  description = "The VPC ID"
  value       = module.private_sec_group.security_group_vpc_id
}


output "security_group_name" {
  description = "The name of the security group"
  value       = module.private_sec_group.security_group_name
}