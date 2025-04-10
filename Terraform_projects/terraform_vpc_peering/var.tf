variable "ami_ohio_and_paris" {
  type = list(string)
  default = ["ami-0100e595e1cc1ff7f" , "ami-0d8423e33dfb7aaea"]   # 0 = ohio_ami , 1 = paris_ami
}
variable "instance_types" {
  type = map(string)
  default = {
    "t1" = "t2.micro"
    "t2" = "t2.medium"
    "t3" = "t2.nano"
  }
}
variable "key_pairs" {
  type = list(string)
  default = ["terraform-key" , "paris-key"]
}
variable "associate_public_ip_address" {
  type = bool
  default = true
}
variable "aws_region" {
  type = map(string)
  default = {
    "ohio" = "us-east-2"
    "paris" = "eu-west-3"
  }
}
variable "aws_region_ohio" {
  default = "us-east-2"
  type = string
}
variable "aws_region_paris" {
  default = "eu-west-3"
  type = string
}
