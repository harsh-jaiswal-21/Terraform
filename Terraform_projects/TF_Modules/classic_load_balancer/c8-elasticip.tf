resource "aws_eip" "my_ip" {
  depends_on = [module.vpc, module.public_instance]
  instance   = module.public_instance.id
  domain     = "vpc"

  tags = local.common_tags

# The Destroy Provisioner doesnt work inside null Resource So I Decided To Put It Here 
     provisioner "local-exec" {
      command = "echo The Module Was Destroyed on `date` >> destroy-time-provision.txt"
      working_dir = "local-exec-output-files/"
      when = destroy
      # on_failure = continue
    }  
}
output "eip_public_bastion" {
  value = aws_eip.my_ip.id
}