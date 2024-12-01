module "private_sg" {
  depends_on = [module.vpc]
  source     = "terraform-aws-modules/security-group/aws"
  version    = "5.2.0"

  name        = "private_sg"
  description = "Security group for incoming traffic from internet"
  vpc_id      = module.vpc.vpc_id

  ingress_cidr_blocks = [module.vpc.vpc_cidr_block]
  ingress_rules       = ["ssh-tcp", "http-80-tcp"]

  # egress rules
  egress_rules = ["all-all"]

  tags = local.common_tags
}
