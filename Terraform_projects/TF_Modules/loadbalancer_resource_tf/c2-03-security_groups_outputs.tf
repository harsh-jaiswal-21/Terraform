output "public_sg_id" {
  value = aws_security_group.public_sg.id
}
# output "loadbalancer_CIDR" {
#   value = aws_security_group.loadbalancer_sg.
# }

output "loadbalancer_sg_id" {
  value = aws_security_group.loadbalancer_sg.id
}
