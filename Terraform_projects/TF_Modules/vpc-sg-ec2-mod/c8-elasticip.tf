resource "aws_eip" "lb" {
  instance = module.ec2_public.id
  domain   = "vpc"

  depends_on = [module.ec2_public, module.vpc]
  tags       = local.common_tags
}

output "elastic_ip" {
  description = "elastic ip for public instance"
  value       = aws_eip.lb.public_ip
}