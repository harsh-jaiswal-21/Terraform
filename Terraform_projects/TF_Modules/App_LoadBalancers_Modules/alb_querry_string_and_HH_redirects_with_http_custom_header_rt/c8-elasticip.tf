resource "aws_eip" "lb" {
  depends_on = [module.vpc, module.ec2_public]
  instance   = module.ec2_public.id
  domain     = "vpc"
  tags       = local.common_tags



  # THE ONLY REASON TO RUN THIS DESTROY TIME PROVISIONERS IS THAT IT CANT BE RUN INDEPENDENTLY AND CAN'T BE RUN IN NULL RESOURCE AS WELL
  # YOU AND PUT THIS PROVISIONER BLOCK ANYWHERE OTHER THAN (ABOVE LINE)
  # ALL Porvisioners are Creation Time Provisioners By Default Untill We use FLAG 'when = destroy'

  provisioner "local-exec" {
    command     = "echo VPC DESTROYED ON `date` >> destruction_time_details.txt"
    working_dir = "./records"
    # on_failure = continue
    when = destroy
  }
}
output "eip_of_ec2instance" {
  value       = aws_eip.lb.public_ip
  description = "prints ec2 instance's elastic ip"
}