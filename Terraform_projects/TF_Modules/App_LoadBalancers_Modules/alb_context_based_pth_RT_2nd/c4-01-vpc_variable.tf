variable "vpc_cidr" {
  type        = string
  description = "The IPv4 CIDR block for the VPC"
}
variable "azs" {
  type        = list(string)
  description = "The IPv4 CIDR block for the VPC"
}
variable "public_subnets" {
  type        = list(string)
  description = "The IPv4 CIDR block for the VPC"
}
variable "private_subnets" {
  type        = list(string)
  description = "The IPv4 CIDR block for the VPC"
}
variable "database_subnets" {
  type        = list(string)
  description = "The IPv4 CIDR block for the VPC"
}
variable "create_database_subnet_group" {
  type        = bool
  description = "The IPv4 CIDR block for the VPC"
}
variable "create_database_subnet_route_table" {
  type        = bool
  description = "The IPv4 CIDR block for the VPC"
}
variable "enable_nat_gateway" {
  type        = bool
  description = "The IPv4 CIDR block for the VPC"
}
variable "single_nat_gateway" {
  type        = bool
  description = "The IPv4 CIDR block for the VPC"
}