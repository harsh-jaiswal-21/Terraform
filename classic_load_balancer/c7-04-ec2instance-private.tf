module "private_instances" {
  depends_on = [module.vpc]
  source     = "terraform-aws-modules/ec2-instance/aws"
  version    = "5.7.1"
  name       = "private_instances"

  ami           = data.aws_ami.bleach.id
  instance_type = var.instance_type
  key_name      = var.instance_keypair
  #  monitoring             = true
  vpc_security_group_ids = [module.private_security_group.security_group_id]
  tags                   = local.common_tags
  user_data              = file("/app-1.sh")

  # Old version 
  /* subnet_ids = [module.vpc.public_subnets[0] , module.vpc.public_subnets[1]]
     instance_count = 2 */

  # Latest version

  for_each  = toset(["0", "1"])
  subnet_id = element(module.vpc.private_subnets, tonumber(each.key))
}