output "instance_type_ohio" {
  value = aws_instance.o_instance.instance_type
}
output "ohio_vpc_id" {
  value = aws_vpc.ohio_vpc.id
  description = "vpc ohio id"
}
output "ohio_public_subnet_1_id" {
  value = aws_subnet.public_subnet_ohio_1.id
  description = "subnet_id"
}
output "ohio_public_subnet_2_id" {
  value = aws_subnet.public_subnet_ohio_2.id
  description = "subnet_id"
}
output "private_subnet_ohio_1_id" {
  value = aws_subnet.private_subnet_ohio_1.id
  description = "subnet_id"
}
output "private_subnet_ohio_2_id" {
  value = aws_subnet.private_subnet_ohio_2.id
  description = "subnet_id"
}
