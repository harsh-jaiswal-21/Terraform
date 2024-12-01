# Public SG Outputs
output "Public_security_group_id" {
  description = "The ID of the security group"
  value       = module.public_bastion_sg.security_group_id
}

output "Public_security_group_vpc_id" {
  description = "The VPC ID"
  value       = module.public_bastion_sg.security_group_vpc_id
}

output "Public_security_group_owner_id" {
  description = "The owner ID"
  value       = module.public_bastion_sg.security_group_owner_id
}

# Private SG Outputs

output "Private_security_group_id" {
  description = "The ID of the security group"
  value       = module.private_sg.security_group_id
}

output "Private_security_group_vpc_id" {
  description = "The VPC ID"
  value       = module.private_sg.security_group_vpc_id
}

output "Private_security_group_owner_id" {
  description = "The owner ID"
  value       = module.private_sg.security_group_owner_id
}

# Loadbalancer Sg Outputs 

output "Loadbalancer_Sg_id" {
  description = "The ID of the security group"
  value       = module.loadbalancer_sg.security_group_id
}

output "Loadbalancer_Sg_vpc_id" {
  description = "The VPC ID"
  value       = module.loadbalancer_sg.security_group_vpc_id
}

output "Loadbalancer_Sg_owner_id" {
  description = "The owner ID"
  value       = module.loadbalancer_sg.security_group_owner_id
}