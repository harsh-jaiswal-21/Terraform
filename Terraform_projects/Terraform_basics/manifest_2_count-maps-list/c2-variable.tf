variable "aws_region" {
  type        = string
  description = "region for terraform to work passed as variable"
  default     = "us-east-2"
}
variable "keyname" {
  type        = string
  description = "key passed as variable"
  default     = "terraform-key"
}

variable "instance_type_list" {
  type        = list(string)
  description = "instance type passed as variable in list"
  default     = ["t3.large", "m5.large", "t2.micro"]
}

variable "instance_type_map" {
  type        = map(string)
  description = "instance type passed as variable in maps"
  default = {
    "prod" = "t3.large"
    "dev"  = "t2.micro"
    "qa"   = "m5.large"
  }
}