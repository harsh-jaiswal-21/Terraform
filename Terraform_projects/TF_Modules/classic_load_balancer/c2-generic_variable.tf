variable "aws_region" {
  type        = string
  description = "region for aws to provision"
}
variable "business_division" {
  type        = list(string)
  description = "for naming convention"
}
variable "env" {
  type        = map(string)
  description = "(optional) describe your variable"
}