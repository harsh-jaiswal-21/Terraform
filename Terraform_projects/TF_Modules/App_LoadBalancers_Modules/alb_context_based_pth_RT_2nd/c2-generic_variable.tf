variable "aws_region" {
  type        = string
  description = "region for terraform to provision"
}
variable "bussiness_division" {
  type        = map(string)
  description = "for naming convention"
}
variable "enviornment" {
  type        = list(string)
  description = "Env for which the code is"
}