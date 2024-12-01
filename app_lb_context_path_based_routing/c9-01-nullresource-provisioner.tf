resource "null_resource" "nully" {
  depends_on = [module.ec2_public]
  connection {
    type        = "ssh"
    user        = "ec2-user"
    password    = ""
    host        = aws_eip.lb.public_ip
    private_key = file("/terraform-key-us1")
  }
  provisioner "file" {
    source      = "/terraform-key"
    destination = "/tmp/terraform-key"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod 400 /tmp/terraform-key"
    ]
  }
  # ALL Porvisioners are Creation Time Provisioners By Default Untill We use FLAG 'when = destroy' then it becomes destroy time provisioners
  provisioner "local-exec" {
    command     = "echo VPC CREATED ON `date` >> creation_time_details.txt"
    working_dir = "./records"
    # on_failure = continue
  }
}