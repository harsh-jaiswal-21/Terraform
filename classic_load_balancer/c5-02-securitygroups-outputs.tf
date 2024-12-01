# Public Sg OutPuts
output "security_group_id" {
  description = "The ID of the security group"
  value       = module.public_bastion_security_group.security_group_id
}

output "security_group_vpc_id" {
  description = "The VPC ID"
  value       = module.public_bastion_security_group.security_group_vpc_id
}

output "security_group_owner_id" {
  description = "The owner ID"
  value       = module.public_bastion_security_group.security_group_owner_id
}

# Private Sg Outputs

output "private_security_group_id" {
  description = "The ID of the security group"
  value       = module.private_security_group.security_group_id
}

output "private_security_group_vpc_id" {
  description = "The VPC ID"
  value       = module.private_security_group.security_group_vpc_id
}

output "private_security_group_owner_id" {
  description = "The owner ID"
  value       = module.private_security_group.security_group_owner_id
}