resource "aws_instance" "bvm" {
  ami                     = data.aws_ami.dank.id
# instance_type           = var.instance_type_list[0]
  instance_type           = var.instance_type_maps["dev"]
  key_name                = var.key_name
  user_data               = file("/app-1.sh")
  for_each = toset(data.aws_availability_zones.aholes.names)
  availability_zone = each.value
  tags = {
    Name = "Server-Niggas-${each.key}"
  }

}

data "aws_availability_zones" "aholes" {
  filter {
    name   = "opt-in-status"
    values = ["opt-in-not-required"]
  }
}