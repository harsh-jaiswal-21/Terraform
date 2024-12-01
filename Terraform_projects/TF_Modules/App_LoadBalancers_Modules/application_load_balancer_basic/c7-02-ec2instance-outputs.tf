# Public instance Outputs
output "public_instance_id" {
  description = "The ID of the instance"
  value       = module.public_instance.id
}
output "public_instance_public_ip" {
  description = "The public IP address assigned to the instance, if applicable. NOTE: If you are using an aws_eip with your instance, you should refer to the EIP's address directly and not use `public_ip` as this field will change after the EIP is attached"
  value       = module.public_instance.public_ip
}

# Private instance Outputs
output "private_instance_id" {
  description = "The ID of the instance"
  value       = [for server in module.private_instances : server.id]
}
output "private_instance_private_ip" {
  description = "The public IP address assigned to the instance, if applicable. NOTE: If you are using an aws_eip with your instance, you should refer to the EIP's address directly and not use `public_ip` as this field will change after the EIP is attached"
  value       = { for fe, server in module.private_instances : fe => server.private_ip }
}
