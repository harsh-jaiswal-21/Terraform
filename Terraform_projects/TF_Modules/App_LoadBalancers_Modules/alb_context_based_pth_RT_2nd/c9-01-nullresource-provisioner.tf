resource "null_resource" "no_name" {
  depends_on = [module.bastion_server, module.vpc]
  connection {
    type        = "ssh"
    user        = "ec2-user"
    host        = aws_eip.meip.public_ip
    private_key = file("/terraform-key")
  }
  # all provisioners are by default are creation time provisioiners untill you use "when = destroy" flag
  # after using when = destroy  flag it becomes destroy time provisioners and it cant run inside null_resource
  # Check c8-elastic.ip file it is there
  provisioner "file" {
    source      = "/terraform-key"
    destination = "/tmp/terraform-key"
  }
  provisioner "remote-exec" {
    inline = [
      "chmod 400 /tmp/terraform-key"
    ]
  }
  provisioner "local-exec" {
    command     = "echo This IAC Provisioning Has Started on `date` >> creation_time.txt"
    working_dir = "./history"
    # on_failure = continue
  }
}