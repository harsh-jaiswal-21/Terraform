module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "9.11.1"
  depends_on = [module.vpc, module.public_instance, module.private_instances] # my self created dependencies

  name    = "${local.name}-alb"
  load_balancer_type = "application"
  vpc_id  = module.vpc.vpc_id
  subnets = module.vpc.public_subnets
  security_groups = [module.loadbalancer_sg.security_group_id]
  enable_deletion_protection = false

  tags = local.common_tags

  #Listeners
    listeners = {
     # Listener-1: my-http-listener
    my-http-listener = {
      port            = 80
      protocol        = "HTTP"
      forward = {
        target_group_key = "mytg1"
      }
    }
     # Listener-2: my-http-listener
    my-http-listener-2 = {
      port            = 81
      protocol        = "HTTP"
      forward = {
        target_group_key = "mytg1"
      }
    }  # end of my-http-listener 
  }#END OF LISTENER BLOCK


  #Target Group
    target_groups = {

     mytg1 = {
      #VERY IMPORTANT: "aws_lb_target_group_attachment" resource seperately when we use create_attachment = false,
     ## Github ISSUE: https://github.com/terraform-aws-modules/terraform-aws-alb/issues/316  
     ## Search for "create_attachment" to jump to that Github issue solution
      create_attachment = false   
      name_prefix                       = "mytg1-"
      protocol                          = "HTTP"
      port                              = 80
      target_type                       = "instance"
      deregistration_delay              = 10
      load_balancing_cross_zone_enabled = false
      protocol_version = "HTTP1"

      health_check = {
        enabled             = true
        interval            = 30
        path                = "/app1/index.html"
        port                = "traffic-port"
        healthy_threshold   = 3
        unhealthy_threshold = 3
        timeout             = 6
        protocol            = "HTTP"
        matcher             = "200-399"
      }
      tags = local.common_tags  
    }
 }  # ENFD FO TAGRET GROUP: mytg1
    # END OF TARGET GROUPS

}


# Load Balancer Target Group Attachment  
  resource "aws_lb_target_group_attachment" "mytg1" {
  depends_on = [module.alb]  
  for_each = {for k , v in module.private_instances: k => v}   
  target_group_arn = module.alb.target_groups["mytg1"].arn
  target_id        = each.value.id
  port             = 80
}
# k = ec2_instances
# v = ec2_instances_details


# Temp Outputs
output "ec2_pvt_for_understanding" {
  #value = {for k , v in module.private_instances: k => v }
  value = {for ec2_instances , ec2_instances_details in module.private_instances: ec2_instances => ec2_instances_details} # for explaination 

}