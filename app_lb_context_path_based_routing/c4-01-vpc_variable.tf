variable "vpc_cidr" {
  description = "CIDR BLOCK FOR VPC"
  type        = string
}
variable "azs" {
  description = "list of availablity zones"
  type        = list(string)
}
variable "private_subnets" {
  description = "List Of Private Subnets"
  type        = list(string)
}
variable "public_subnets" {
  description = "List Of Public Subnets"
  type        = list(string)
}
variable "database_subnets" {
  description = "List Of Database Subnets"
  type        = list(string)
}
variable "create_database_subnet_route_table" {
  description = "database subnet route table"
  type        = bool
}
variable "create_database_subnet_group" {
  description = "database subnet group"
  type        = bool
}
variable "enable_nat_gateway" {
  description = "Nat Gateway"
  type        = bool
}
variable "single_nat_gateway" {
  description = "single_nat_gateway"
  type        = bool
}