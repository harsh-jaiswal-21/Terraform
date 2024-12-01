module "ec2_public" {
  source  = "terraform-aws-modules/ec2-instance/aws"
# version = "2.17.0" Old Version
  version = "5.7.0" # Latest version
  name                   = "${var.env["EV3"]}-ec2_public"
  ami                    = data.aws_ami.myami.id 
  instance_type          = var.instance_type
  key_name               = var.instance_keypair
# instance_count         =  2  
# monitoring             = true
  vpc_security_group_ids = [module.public_security_group.security_group_id]
  subnet_id              = module.vpc.public_subnets[0]
  tags = local.common_tags
# associate_public_ip_address = aws_eip.lb.public_ip
  

# The Old Version Of this module have Some Changes that arent applicable in current version of module
}