resource "aws_instance" "public_instances" {
  ami                         = data.aws_ami.xyz.id
  instance_type               = "t2.micro"
  key_name                    = "linuxkey"
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.public_sg.id]
  subnet_id                   = aws_subnet.public_subnet.id
  availability_zone           = "us-east-2a"
  user_data                   = file("/app-1.sh")
  count                       = 2

  tags = {
    Name = "public_instances"
  }
}
