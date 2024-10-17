resource "null_resource" "my_nulla" {
  depends_on = [module.public_instance]
  connection {
    type        = "ssh"
    user        = "ec2-user"
    password    = ""
    host        = aws_eip.my_ip.public_ip
    private_key = file("/terraform-key")
  }


  provisioner "file" {
    source      = "/terraform-key"
    destination = "/tmp/terraform-key"
  }


  provisioner "remote-exec" {
    inline = [
      "sudo chmod 400 /tmp/terraform-key"
    ]
  }

  provisioner "local-exec" {
    command     = "echo The Module Was Created on `date` >> creation-time-provision.txt"
    working_dir = "local-exec-output-files/"
    # on_failure = continue
  }

  #      provisioner "local-exec" {
  #     command = "echo The Module Was Destroyed on `date` >> destroy-time-provision.txt"
  #     working_dir = "local-exec-output-files/"
  #     when = destroy
  #     # on_failure = continue
  #   }  
}