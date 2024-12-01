resource "aws_instance" "mchin_1" {
  ami                     = "ami-066784287e358dad1"
  instance_type           = "t2.micro"
  key_name                = "terraform-key-us1"
  user_data               = file("./app-1.sh")
  vpc_security_group_ids  = [aws_security_group.tf-sg.id]
  subnet_id               = aws_subnet.public_subnet-1.id
  associate_public_ip_address = true
  tags = {
    Name = "my-instance"
  }
}
resource "aws_instance" "mchin_3" {
  ami                     = "ami-066784287e358dad1"
  instance_type           = "t2.micro"
  key_name                = "terraform-key-us1"
  user_data               = file("./app-1.sh")
  vpc_security_group_ids  = [aws_security_group.tf-sg.id]
  subnet_id               = aws_subnet.public_subnet-2.id
  associate_public_ip_address = true
  tags = {
    Name = "my-instance"
  }
}
resource "aws_instance" "mchin_2" {
  ami                     = "ami-066784287e358dad1"
  instance_type           = "t2.micro"
  key_name                = "terraform-key-us1"
  user_data               = file("./app-1.sh")
  vpc_security_group_ids  = [aws_security_group.tf-sg.id]
  subnet_id               = aws_subnet.private_subnet-1.id
  associate_public_ip_address = true
  tags = {
    Name = "my-instance-2"
  }
}
resource "aws_instance" "mchin_4" {
  ami                     = "ami-066784287e358dad1"
  instance_type           = "t2.micro"
  key_name                = "terraform-key-us1"
  user_data               = file("./app-1.sh")
  vpc_security_group_ids  = [aws_security_group.tf-sg.id]
  subnet_id               = aws_subnet.private_subnet-2.id
  associate_public_ip_address = true
  tags = {
    Name = "my-instance-2"
  }
}