module "loadbalancer_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.2.0"

  name        = "loadbalancer_sg"
  description = "Security group for incoming traffic from internet"
  vpc_id      = module.vpc.vpc_id

  ingress_cidr_blocks = ["0.0.0.0/0"]
  ingress_rules       = ["https-443-tcp", "http-80-tcp"]

  # egress rules
  egress_rules = ["all-all"]

  tags = local.common_tags
}
