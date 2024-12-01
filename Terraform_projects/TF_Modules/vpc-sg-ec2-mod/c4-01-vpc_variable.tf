variable "vpc_name" {
  type        = string
  description = ""
}
variable "vpc_cidr_block" {
  type        = string
  description = "CIDR BLOCK FOR VPC"
}
variable "avl_zs" {
  type        = list(string)
  description = "AZ'S FOR VPC "
}
variable "public_subnets" {
  type        = list(string)
  description = "PUBLIC SUBNETS FOR VPC"
}
variable "private_subnets" {
  type        = list(string)
  description = "PRIVATE SUBNETS FOR VPC"
}
variable "database_subnets" {
  type        = list(string)
  description = "DB SUBNETS FOR VPC"
}
variable "create_database_subnet_group" {
  type        = bool
  description = "CREATES SUBNET GROUP FOR DATABASE SUBNETS"
}
variable "create_database_subnet_route_table" {
  type        = bool
  description = "CREATING ROUTE TABLE FOR DB SUBNETS"
}
variable "enable_nat_gateway" {
  type        = bool
  description = "CREATES NAT GATEWAY"
}
variable "single_nat_gateway" {
  type        = bool
  description = "ONLY ALOLOWS US TO CREATE SINGLE NAT GATEWAY FOR MORE THAN 1 AZ"
}