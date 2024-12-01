output "instance_public_ip" {
    description = "instance's public ip"
    value = aws_instance.example.public_ip
}

output "instance_public_dns" {
    description = "instance's public dns"
    value = aws_instance.example.public_dns
}