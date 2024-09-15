module "private_bastion_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.2.0"

  name = "private-bastion-sg"
  description = "bastion sg for instances"
  vpc_id = module.vpc.vpc_id

  ingress_rules       = ["ssh-tcp" , "http-80-tcp"]
  ingress_cidr_blocks = [module.vpc.vpc_cidr_block]

  egress_rules = ["all-all"]
  tags = local.common_tags
}