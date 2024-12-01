module "public_security_group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.2.0"

  description = "security group for bastion server"
  name        = "public_security_group"
  vpc_id      = module.vpc.vpc_id

  # Ingress Rules
  ingress_cidr_blocks = ["0.0.0.0/0"]
  ingress_rules       = ["ssh-tcp"]

  # Egress rules
#  egress_cidr_blocks = ["0.0.0.0/0"] #["all-all"]
  egress_rules = ["all-all"]

}