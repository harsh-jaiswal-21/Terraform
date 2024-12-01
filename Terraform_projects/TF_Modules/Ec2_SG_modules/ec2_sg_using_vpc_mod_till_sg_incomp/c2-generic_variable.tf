variable "aws_region" {
    type = string
    description = "regio0 for terraform to provision"
}

variable "business_division" {
    type = list(string)
    description = "variable for naming convention"
}

variable "env" {
    type = map(string)
    description = "variable  for mentioning for which enviornment the code is provisioning"
}