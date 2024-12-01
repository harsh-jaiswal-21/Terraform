module "public_bastion_security_group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.2.0"

  name   = "public_bastion_security_group"
  vpc_id = module.vpc.vpc_id

  # Ingress Rules
  ingress_cidr_blocks = ["0.0.0.0/0"]
  ingress_rules       = ["ssh-tcp"]

  # Egress Rules
  egress_rules = ["all-all"]

  tags = local.common_tags
}