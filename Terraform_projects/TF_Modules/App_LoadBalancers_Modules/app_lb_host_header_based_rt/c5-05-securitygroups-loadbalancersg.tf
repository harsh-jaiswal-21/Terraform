module "loadbalancer_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.2.0"

  name        = "loadbalancer_sg"
  description = "SECURITY GROUP FOR Loadbalancer"
  vpc_id      = module.vpc.vpc_id

  # Ingress (Incoming Traffic)
  ingress_cidr_blocks = ["0.0.0.0/0"]
  ingress_rules       = ["http-80-tcp", "https-443-tcp"]

  ingress_with_cidr_blocks = [
    {
      from_port = 81
      to_port   = 81
      #protocol    = "tcp"
      protocol    = 6
      description = "allow port 81 from internet"
      cidr_blocks = "0.0.0.0/0"
    },
  ]

  # Egress (Outgonig Traffic)
  egress_rules = ["all-all"]
}