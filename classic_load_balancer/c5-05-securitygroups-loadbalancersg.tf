module "loadbalancer_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.2.0"

  name   = "loadbalancer_sg"
  vpc_id = module.vpc.vpc_id

  # Ingress Rules
  ingress_cidr_blocks = ["0.0.0.0/0"]
  ingress_rules       = ["http-80-tcp"]

  # Egress Rules
  egress_rules = ["all-all"]

  tags = local.common_tags
}
# module.loadbalancer_sg.security_group_id