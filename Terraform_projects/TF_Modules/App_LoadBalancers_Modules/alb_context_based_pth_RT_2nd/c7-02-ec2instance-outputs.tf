# Public instance Outputs
output "public_instance_id" {
  value       = module.bastion_server.id
  description = "prints public ip of instance"
}
output "bastion_server_public_ip" {
  description = "The public IP address assigned to the instance, if applicable. NOTE: If you are using an aws_eip with your instance, you should refer to the EIP's address directly and not use `public_ip` as this field will change after the EIP is attached"
  value       = module.bastion_server.public_ip
}
# Private APP1 instance Outputs
output "ec2_private_app1_id" {
  value       = [for instance in module.ec2_private_app1 : instance.id]
  description = "prints public ip of instance"
}
output "ec2_private_app1_private_ip" {
  description = "The public IP address assigned to the instance, if applicable. NOTE: If you are using an aws_eip with your instance, you should refer to the EIP's address directly and not use `public_ip` as this field will change after the EIP is attached"
  value       = [for instance in module.ec2_private_app1 : instance.private_ip]
}
# Private APP2 instance Outputs
output "ec2_private_app2_id" {
  value       = [for instance in module.ec2_private_app2 : instance.id]
  description = "prints public ip of instance"
}
output "ec2_private_app2_private_ip" {
  description = "The public IP address assigned to the instance, if applicable. NOTE: If you are using an aws_eip with your instance, you should refer to the EIP's address directly and not use `public_ip` as this field will change after the EIP is attached"
  value       = [for instance in module.ec2_private_app2 : instance.private_ip]
}