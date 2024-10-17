resource "aws_eip" "my_ip" {
  depends_on = [module.vpc, module.public_instance]
  instance   = module.public_instance.id
  domain     = "vpc"

  tags = local.common_tags
}
output "eip_public_bastion" {
  value = aws_eip.my_ip.id
}