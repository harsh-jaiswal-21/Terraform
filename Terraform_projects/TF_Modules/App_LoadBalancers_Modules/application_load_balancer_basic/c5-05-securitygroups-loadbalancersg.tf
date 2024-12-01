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

  # Open to CIDRs blocks (rule or from_port+to_port+protocol+description)
  ingress_with_cidr_blocks = [
    {
      from_port   = 81
      to_port     = 81
      protocol    = 6
      description = "Service name"
      cidr_blocks = "0.0.0.0/0"
    },
  ]
}
# module.loadbalancer_sg.security_group_id