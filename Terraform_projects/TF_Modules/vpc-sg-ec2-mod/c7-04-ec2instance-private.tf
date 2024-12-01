module "ec2_private" {
  depends_on = [ module.vpc ]
  source = "terraform-aws-modules/ec2-instance/aws"
  # version = "2.17.0" Old Version
  version       = "5.7.0" # Latest version
  name          = "${var.env["EV3"]}-ec2_private"
  ami           = data.aws_ami.myami.id
  instance_type = var.instance_type
  key_name      = var.instance_keypair
  # instance_count         =  2  
  # monitoring             = true
  vpc_security_group_ids = [module.private_security_group.security_group_id]
  user_data              = file("/app-1.sh")
  tags                   = local.common_tags


  # The Old Version Of this module have Some Changes that arent applicable in current version of module
  /* 
 subnet_ids = [module.vpc.private_subnets[0] ,
               module.vpc.private_subnets[1] ]
                               AND
 instance_count =1 */
  # now as we know we cant use the old way of creating multiple instances using instance_count argument 

  # Updates 

  for_each  = toset(["0", "1"])
  subnet_id = element(module.vpc.private_subnets, tonumber(each.key))

}