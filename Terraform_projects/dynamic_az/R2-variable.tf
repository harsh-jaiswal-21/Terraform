variable "aws_region" {
    type = string
    description = "Region for terraform provisioning"
    default = "us-east-1"
}
variable "instance_type" {
    type = list(string)
    description = "predefined configuration for aws virtual machine with diff combination CPU, MEMORY , NETWORKING (instance type list)"
    default = ["t3.micro" , "t2.large"]
}
variable "instance_keypair" {
    type = map(string)
    description = ""
    default = {
        "dev" = "terraform-key-us1"
        "prod" = "V-KEY"
    }
}