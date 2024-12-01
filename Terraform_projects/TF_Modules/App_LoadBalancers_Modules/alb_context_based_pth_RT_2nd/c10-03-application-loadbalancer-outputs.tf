################################################################################
# Load Balancer
################################################################################

output "Load_Balancer_id" {
  description = "The ID and ARN of the load balancer we created"
  value       = module.alb.id
}

output "Load_Balancer_arn" {
  description = "The ID and ARN of the load balancer we created"
  value       = module.alb.arn
}

output "Load_Balancer_arn_suffix" {
  description = "ARN suffix of our load balancer - can be used with CloudWatch"
  value       = module.alb.arn_suffix
}

output "Load_Balancer_dns_name" {
  description = "The DNS name of the load balancer"
  value       = module.alb.dns_name
}

output "Load_Balancer_zone_id" {
  description = "The zone_id of the load balancer to assist with creating DNS records"
  value       = module.alb.zone_id
}

################################################################################
# Listener(s)
################################################################################

output "listeners" {
  description = "Map of listeners created and their attributes"
  value       = module.alb.listeners
  sensitive   = true
}

output "listener_rules" {
  description = "Map of listeners rules created and their attributes"
  value       = module.alb.listener_rules
  sensitive   = true
}

################################################################################
# Target Group(s)
################################################################################

output "target_groups" {
  description = "Map of target groups created and their attributes"
  value       = module.alb.target_groups
}

output "test" {
    value = {for instance , details in module.ec2_private_app1 : instance => details} 
}