module "public_sec_group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.2.0"
  
  name = "public_sec_group"
  vpc_id = module.vpc.vpc_id

# Ingress Rules For Sec_Gp 
  ingress_cidr_blocks = ["0.0.0.0/0"]
  ingress_rules       = ["ssh-tcp"]

#  Egress Rule For Sg
   egress_cidr_blocks = ["all-all"]
   tags = local.common_tags
}