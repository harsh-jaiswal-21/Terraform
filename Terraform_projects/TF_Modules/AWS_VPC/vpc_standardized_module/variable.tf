variable "aws_region" {
  type        = string
  description = "region for terraform to provision"
}
variable "Enviornment" {
  type        = list(string)
  description = "various enviornment for deployment"
}
variable "business_division" {
  type        = string
  description = "bussiness division"
}