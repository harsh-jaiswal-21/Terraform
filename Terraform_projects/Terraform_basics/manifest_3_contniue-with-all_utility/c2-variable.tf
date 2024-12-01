variable "region" {
    type = string
    description = "region for terraform to work"
    default = "us-east-1"
}

variable "key" {
    type = string
    description = "key for instances"
    default = "terraform-key-us1"
}

variable "list" {
    type = list(string)
    description = "passing instance type as list"
    default = ["t3.micro" , "t3.medium" , "m5.large"]
}

variable "maps" {
  type = map(string)
  description = "passing instance type as maps"
  default = {
    "dev" = "t3.micro"
    "qa" = "t3.medium"
    "prod" = "m5.large"
  }
}
