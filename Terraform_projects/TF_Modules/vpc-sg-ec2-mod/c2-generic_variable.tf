variable "aws_region" {
  type        = string
  description = "region for terraform to work"
}
variable "bussiness_division" {
  type        = list(string)
  description = "For naming convention"
}
variable "env" {
  type        = map(string)
  description = "For naming convention"
} 