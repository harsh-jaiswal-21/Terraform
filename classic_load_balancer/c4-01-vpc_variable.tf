variable "vpc_cidr_block" {
  type        = string
  description = "VPC CIDR BLOCK"
}
variable "vpc_name" {
  type        = string
  description = "Name for VPC"
}
variable "azones" {
  type        = list(string)
  description = "availablity zones for vpc"
}
variable "public_subnets" {
  type        = list(string)
  description = "public subnets for vpc"
}
variable "private_subnets" {
  type        = list(string)
  description = "private subnets for vpc"
}
variable "database_subnets" {
  type        = list(string)
  description = "database subnets for vpc"
}
variable "database_subnet_group" {
  type        = bool
  description = "allowing database subnet group to be created"
}
variable "database_subnet_route_table" {
  type        = bool
  description = "allowing database subnet route table to be created"
}
variable "enable_nat_gateway" {
  type        = bool
  description = "allowing nat_gateway to be created"
}
variable "single_nat_gateway" {
  type        = bool
  description = "allowing only single_nat_gateway to be created"
}
