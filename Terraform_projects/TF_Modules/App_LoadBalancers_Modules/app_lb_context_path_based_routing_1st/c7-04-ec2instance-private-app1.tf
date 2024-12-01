module "ec2_private_app1" {
  depends_on = [module.vpc]
  source     = "terraform-aws-modules/ec2-instance/aws"
  version    = "5.7.1"

  name = "ec2_private_app1"

  ami           = data.aws_ami.image.id
  instance_type = var.instance_type
  key_name      = var.instance_keypair
  # monitoring             = true
  vpc_security_group_ids = [module.private_sg.security_group_id]
  #  subnet_id              = module.vpc.public_subnets[0]
  user_data = file("/app-1.sh")

  # Old version
  #   subnet_ids = [module.vpc.private_subnets[0] ,
  #                 module.vpc.private_subnets[1]]
  # instance_count = 2

  # Updates in Module,we cant use instance_count and Subnet_ids Arguments to create multiple instances with the pvt subnets we provide 
  # as you can see above

  # UPDATES

  for_each  = toset(["0", "1"])
  subnet_id = element(module.vpc.private_subnets, each.key)
  tags      = local.common_tags


}