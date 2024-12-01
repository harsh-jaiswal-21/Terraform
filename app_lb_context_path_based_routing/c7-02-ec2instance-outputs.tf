# Public Instance Outputs
output "ec2_public_id" {
  description = "The ID of the instance"
  value       = module.ec2_public.id
}
output "ec2_public_public_ip" {
  description = "The public IP address assigned to the instance, if applicable. NOTE: If you are using an aws_eip with your instance, you should refer to the EIP's address directly and not use `public_ip` as this field will change after the EIP is attached"
  value       = module.ec2_public.public_ip
}


# Private Instance Outputs APP-1
output "ec2_private_id_app1" {
  description = "The ID of the instance"
  value       = [for server in module.ec2_private_app1 : server.id]
}
output "ec2_private_private_ip_app1" {
  description = "The public IP address assigned to the instance, if applicable. NOTE: If you are using an aws_eip with your instance, you should refer to the EIP's address directly and not use `public_ip` as this field will change after the EIP is attached"
  value       = [for server in module.ec2_private_app1 : server.private_ip]
}


# Private Instance Outputs APP-2
output "ec2_private_id_app2" {
  description = "The ID of the instance"
  value       = [for server in module.ec2_private_app2 : server.id]
}
output "ec2_private_private_ip_app2" {
  description = "The public IP address assigned to the instance, if applicable. NOTE: If you are using an aws_eip with your instance, you should refer to the EIP's address directly and not use `public_ip` as this field will change after the EIP is attached"
  value       = [for server in module.ec2_private_app2 : server.private_ip]
}