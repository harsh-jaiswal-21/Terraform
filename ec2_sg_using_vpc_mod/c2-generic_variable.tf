variable "aws_region" {
  type        = string
  description = "region for terraform to provision"
}
variable "env" {
  type        = list(string)
  description = "list of enviornments to be deployed"
}
variable "business_division" {
  type        = map(string)
  description = "business division var passed as maps"
  default = {
    "o1" = "HR"
    "o2" = "SAP"
  }
}