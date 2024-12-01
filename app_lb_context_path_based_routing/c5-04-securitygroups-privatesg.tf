module "private_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.2.0"

  name        = "private_sg"
  description = "SECURITY GROUP FOR PUBLIC INSTANCE"
  vpc_id      = module.vpc.vpc_id

  # Ingress (Incoming Traffic)
  ingress_cidr_blocks = [module.vpc.vpc_cidr_block]
  ingress_rules       = ["http-80-tcp", "ssh-tcp"]

  # Egress (Outgonig Traffic)
  egress_rules = ["all-all"]
  # egress_cidr_blocks = ["0.0.0.0/0"]

  tags = local.common_tags
}