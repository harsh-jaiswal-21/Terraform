resource "aws_instance" "example" {
  ami                         = data.aws_ami.bankai.id
  instance_type               = var.instance_type
  user_data                   = file("${path.module}/app-1.sh")
  key_name                    = var.instance_keypair
  vpc_security_group_ids      =[aws_security_group.my-sg.id]
  associate_public_ip_address = true

  tags = {
    Name = "my-app1"
  }
}


