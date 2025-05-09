resource "aws_instance" "o_instance" {
  provider = aws.ohio
  ami                     = var.ami_ohio_and_paris[0]
  instance_type           = var.instance_types["t1"]
  key_name                 = var.key_pairs[0]
  associate_public_ip_address = var.associate_public_ip_address
 # availability_zone = "us-east-2a"
  subnet_id = aws_subnet.public_subnet_ohio_1.id
  vpc_security_group_ids = [aws_security_group.ohio_sg.id]
  user_data = file("/app-1.sh")

  tags = {
    Name = "o_instance"
  }
  
}