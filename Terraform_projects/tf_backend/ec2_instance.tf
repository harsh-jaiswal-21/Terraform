resource "aws_instance" "this" {
  ami                     = data.aws_ami.example.id
  instance_type           = var.instance_type
  key_name = var.key_name
  vpc_security_group_ids = [aws_security_group.my_sg.id]
  user_data = file("/app2-install.sh")
  subnet_id = aws_subnet.public_1.id
  associate_public_ip_address = true

  tags = local.common_tags
}