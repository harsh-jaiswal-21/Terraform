variable "aws_region" {
  description = "region for terraform to provision"
  type        = string
}
variable "bussiness_division" {
  description = "region for terraform to provision"
  type        = list(string)
}
variable "env" {
  description = "region for terraform to provision"
  type        = map(string)
}