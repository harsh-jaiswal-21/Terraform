resource "aws_eip" "meip" {
  depends_on = [module.bastion_server]
  instance   = module.bastion_server.id
  domain     = "vpc"

  tags = local.common_tags

  provisioner "local-exec" {
    command     = "echo This IAC Provisioning Has Started on `date` >> creation_time.txt"
    working_dir = "./history"
    # on_failure = continue
  }
}
output "Public_instance_eip" {
  value       = aws_eip.meip.public_ip
  description = "Elastic ip of public instance"
}
