# Create The Null Resource And Provisioners
resource "null_resource" "name" {
depends_on = [module.ec2_public]

connection {
    type     = "ssh"
    user     = "ec2-user"
    host     = aws_eip.lb.public_ip
    password = ""
    private_key = file("/terraform-key")
  }

# File Provisioners: Copies The Terraform-key file to /tmp/Terraform-key
  provisioner "file" {
    source      = "/terraform-key"
    destination = "/tmp/terraform-key"
  }
# Remote Exec Provisioners: Using  remote-exec provisioners Fix The private key permission on Bastion srever
  provisioner "remote-exec" {
    inline = [
      "sudo chmod 400 /tmp/terraform-key"
    ]
  }  

# Local Exec Provisioners: local-exec provisioners (Creation-Time Provisioners - Triggered during resource creation (terraform apply)) 
  #   provisioner "local-exec" {
  #   command = "echo VPC created on `date` and VPC ID: ${module.vpc.vpc_id} >> creation-time-vpc-id.txt"
  #   working_dir = "local-exec-output-files/"
  #   #on_failure = continue
  # }
   provisioner "local-exec" {
    command = "echo VPC Created On `date` and VPC ID: ${module.vpc.vpc_id} >> creation-time-vpc_id.txt"
    working_dir = "local-exec-output-files/"
   #on_failure = continue
  }
 # Local Exec Provisioners: local-exec provisioners (Destroy-Time Provisioners - Triggered during resource deletion (terraform destroy))

#    provisioner "local-exec" {
#     command = "echo Destroy Time Prov 'date' >> destroy-time-prov.txt"
#     working_dir = "local-exec-outputs-file/"
#     when = destroy
#    #on_failure = continue
#   }
}
# Creation Time Provisioners - By Default they are created during resource creations (terraform apply)
# Destroy Time Provisioners  - Will Be Executed during "terraform destroy" command (when = destroy)