variable "cidr" {
  type        = string
  description = "cidr block for vpc"
  default     = "10.0.0.0/16"
}
variable "avl_zones" {
  type        = list(string)
  description = "az for module"
  default     = ["us-east-2a", "us-east-2b"]
}
variable "private_subnets" {
  type        = list(string)
  description = "list of subnets for private subnets"
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}
variable "public_subnets" {
  type        = list(string)
  description = "list of subnets for public subnets"
  default     = ["10.0.3.0/24", "10.0.4.0/24"]
}
variable "database_subnets" {
  type        = list(string)
  description = "list of subnets for database subnets"
  default     = ["10.0.5.0/24", "10.0.6.0/24"]
}
variable "create_database_subnet_group" {
  type        = bool
  description = "true for create_database_subnet_group"
  default     = true
}
variable "create_database_subnet_route_table" {
  type        = bool
  description = "true for create_database_subnet_route_table"
  default     = true
}
variable "enable_nat_gateway" {
  type        = bool
  description = "true for enable_nat_gateway"
  default     = true
}
variable "single_nat_gateway" {
  type        = bool
  description = "true for single_nat_gateway"
  default     = true
}
# variable "" {
#     type = bool
#     description = "true for"
#     default = true
# }


