# For Public SG
output "pub_security_group_id" {
  description = "The ID of the security group"
  value       = module.public_security_group.security_group_id
}

output "pub_security_group_vpc_id" {
  description = "The VPC ID"
  value       = module.public_security_group.security_group_vpc_id
}

output "pub_security_group_name" {
  description = "The name of the security group"
  value       = module.public_security_group.security_group_name
}

# For Private Security Group 

output "pvt_security_group_id" {
  description = "The ID of the security group"
  value       = module.private_security_group.security_group_id
}

output "pvt_security_group_vpc_id" {
  description = "The VPC ID"
  value       = module.private_security_group.security_group_vpc_id
}

output "pvt_security_group_name" {
  description = "The name of the security group"
  value       = module.private_security_group.security_group_name
}
