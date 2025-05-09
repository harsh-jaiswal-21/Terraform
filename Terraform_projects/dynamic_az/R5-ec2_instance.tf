resource "aws_instance" "my_vm" {
  ami                     = data.aws_ami.myami.id
  instance_type           = var.instance_type[0]
  key_name                = var.instance_keypair["prod"]
  user_data               = file("/app-1.sh")
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  for_each =  toset(keys({for az, details in data.aws_ec2_instance_type_offerings.myofferings : az => details.instance_types if length(details.instance_types) != 0}))
  availability_zone = each.key                                       # in for_each if we pass set of strings then each.key = each.value
  tags = {                                                           # if we pass maps then each.key != each.value
    Name = "For-Each-Demo-${each.key}"
  }
}
data "aws_availability_zones" "my_azs" {
  filter {
    name   = "opt-in-status"
    values = ["opt-in-not-required"]
  }
}