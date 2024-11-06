module "elb" {
  source  = "terraform-aws-modules/elb/aws"
# version = "2.5.0"
  version = "4.0.2"
  name = "${local.name}-myelb"

  subnets         = [module.vpc.public_subnets[0],
                     module.vpc.public_subnets[1]]  
  security_groups = [module.loadbalancer_sg.security_group_id]
  #internal        = false

  listener = [
    {
      instance_port     = 80
      instance_protocol = "HTTP"
      lb_port           = 80
      lb_protocol       = "HTTP"
    },
    {
      instance_port     = 80
      instance_protocol = "HTTP"
      lb_port           = 81
      lb_protocol       = "HTTP"
    },
  ]

  health_check = {
    target              = "HTTP:80/"
    interval            = 30
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 5
  }


  // ELB attachments

# Old Version Configuration  
#   number_of_instances = var.private_instance_count
#   instances           = [module.private_instances.id[0] , module.private_instances.id[1]]

# Module upgrade change-1 
 number_of_instances = length(module.private_instances)
 
# Module upgrade change-2 
 instances = [for server in module.private_instances: server.id]

 tags = local.common_tags
}
# for_each = toset(["0" , "1"])
# instances = element(module.private_instances.id, tonumber(each.key))