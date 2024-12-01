module "private_security_group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.2.0"

  name   = "private_security_group"
  vpc_id = module.vpc.vpc_id

  # Ingress Rules
  ingress_cidr_blocks = [module.vpc.vpc_cidr_block]
  ingress_rules       = ["ssh-tcp", "http-80-tcp"]

  # Egress Rules
  egress_rules = ["all-all"]

  tags = local.common_tags
}