resource "aws_instance" "this" {
  ami                    = data.aws_ami.brat.id
  instance_type          = var.instance_type_map["qa"]
  key_name               = var.keyname
  vpc_security_group_ids = [aws_security_group.sec_g.id]
  user_data              = file("./app-1.sh")
  count                  = 3
  tags = {
    Name = "http-server-${count.index}"
  }
}
