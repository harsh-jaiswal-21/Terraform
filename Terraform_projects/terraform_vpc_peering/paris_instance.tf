resource "aws_instance" "P_instance" {
  provider = aws.paris
  ami                     = var.ami_ohio_and_paris[1]
  instance_type           = var.instance_types["t1"]
  key_name                 = var.key_pairs[1]
  associate_public_ip_address = var.associate_public_ip_address
 #availability_zone = "eu-west-3"
  subnet_id = aws_subnet.public_subnet_paris_1.id
  vpc_security_group_ids = [aws_security_group.paris_sg.id]
  user_data = file("/app2-install.sh")

  tags = {
    Name = "P_instance"
  }
  
}