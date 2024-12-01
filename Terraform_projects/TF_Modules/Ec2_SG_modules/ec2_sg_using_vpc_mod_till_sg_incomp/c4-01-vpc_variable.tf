variable "cidr" {
    type = string
    description = "CIDR_BLOCK For Vpc"
    default = "10.0.0.0/16"
}
variable "vpc_name" {
    type = string
    description = "(optional) describe your variable"
    default = "myvpc"
}

variable "public_subnets" {
    type = list(string)
    description = "(optional) describe your variable"
    default = ["10.0.1.0/24" , "10.0.2.0/24"]
}
variable "avl_zones" {
    type = list(string)
    description = "availablity zones list"
    default = ["us-east-1a" , "us-east-1b"]
}
variable "private_subnets" {
    type = list(string)
    description = "(optional) describe your variable"
    default = ["10.0.3.0/24" , "10.0.4.0/24"]
}
variable "database_subnets" {
    type = list(string)
    description = "(optional) describe your variable"
    default = ["10.0.5.0/24" , "10.0.6.0/24"]
}
variable "create_database_subnet_group" {
    type = bool
    description = "(optional) describe your variable"
    default = true
}
variable "create_database_subnet_route_table" {
    type = bool
    description = "(optional) describe your variable"
    default = true
}
variable "enable_nat_gateway" {
    type = bool
    description = "(optional) describe your variable"
    default = true
}
variable "single_nat_gateway" {
    type = bool
    description = "(optional) describe your variable"
    default = true
}