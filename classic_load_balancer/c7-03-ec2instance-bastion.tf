module "public_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.7.1"
  name    = "public_instance"

  ami           = data.aws_ami.bleach.id
  instance_type = var.instance_type
  key_name      = var.instance_keypair
  #  monitoring             = true
  # instance_count       = 2
  vpc_security_group_ids = [module.public_bastion_security_group.security_group_id]
  subnet_id              = module.vpc.public_subnets[0]

  tags = local.common_tags
}