output "instance_type_paris" {
  value = aws_instance.P_instance.instance_type
}
output "paris_vpc_id" {
  value = aws_vpc.paris_vpc.id
  description = "vpc paris id"
}
output "paris_public_subnet_1_id" {
  value = aws_subnet.public_subnet_paris_1.id
  description = "subnet_id"
}
output "paris_public_subnet_2_id" {
  value = aws_subnet.public_subnet_paris_2.id
  description = "subnet_id"
}
output "private_subnet_paris_1_id" {
  value = aws_subnet.private_subnet_paris_1.id
  description = "subnet_id"
}
output "private_subnet_paris_2_id" {
  value = aws_subnet.private_subnet_paris_2.id
  description = "subnet_id"
}
