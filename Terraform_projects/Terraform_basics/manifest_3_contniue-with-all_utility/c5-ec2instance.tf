resource "aws_instance" "machine" {
  ami                     = data.aws_ami.ami_content.id
# instance_type           = var.list[1]
  instance_type           = var.maps["dev"]
  key_name                = var.key
  vpc_security_group_ids  = [aws_security_group.basic-sg.id]
  user_data               = file("/app-1.sh")
# for_each = toset(data.aws_availability_zones.cont-1.names)
  for_each = toset(keys({for c , server in data.aws_ec2_instance_type_offerings.xyz: c => server.instance_types
    if length(server.instance_types) !=0}))
  availability_zone = each.key
  tags = {
    Name = "application_svr-${each.value}"
  }
}

data "aws_availability_zones" "cont-1" {
  filter {
    name   = "opt-in-status"
    values = ["opt-in-not-required"]
  }
}
