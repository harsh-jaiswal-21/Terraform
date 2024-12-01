variable "aws_region" {
   default = "us-east-2"
   description = "Region in which aws resources to be created"
   type = string
}

variable "instance_type" {
  description = "EC2 instance type "  
  default = "t2.micro"
  type = string             
}

variable "instance_keypair" {
  default = "terraform-key"    
  type = string
  description = "keypair for instance"             
}