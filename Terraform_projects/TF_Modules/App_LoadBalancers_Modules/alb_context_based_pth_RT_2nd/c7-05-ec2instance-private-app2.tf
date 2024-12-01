module "ec2_private_app2" {
  depends_on = [module.vpc]
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.7.1"

  name = "ec2_private_app2"

  ami           = data.aws_ami.xyz.id
  instance_type = var.instance_type
  key_name      = var.instance_keypair
  # monitoring             = true
  vpc_security_group_ids = [module.private_sg.security_group_id]
  user_data              = file("/app2-install.sh")


  # Old Versions 
  #   subnet_ids = [module.vpc.private_subnets[0] , module.vpc.private_subnets[1]] 
  #   instance_count = 2

  # Latest version
  for_each  = toset(["0", "1"])
  subnet_id = element(module.vpc.private_subnets, each.key)
  tags      = local.common_tags
}