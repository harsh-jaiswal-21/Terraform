output "instance_availablity_zone" {
  value = "us-east-2a"
}
output "public_instance_id" {
  value = aws_instance.public_instances[*].id
}