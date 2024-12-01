variable "cidr_blk" {
  type        = string
  description = "cidr block for vpc"
  default     = "10.0.0.0/16"
}
variable "azones" {
  type        = list(string)
  description = "list of azs for vpc subnets"
  default     = ["us-east-2a", "us-east-2b"]
}
variable "pub_sub" {
  type        = list(string)
  description = "public subnets cidr"
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}
variable "pvt_sub" {
  type        = list(string)
  description = "private subnets cidr"
  default     = ["10.0.3.0/24", "10.0.4.0/24"]
}
variable "db_sub" {
  type        = list(string)
  description = "db subnets cidr"
  default     = ["10.0.5.0/24", "10.0.6.0/24"]
}
variable "create_database_subnet_group" {
  type        = bool
  default     = true
  description = "allowing subnet group to be created"
}
variable "create_database_subnet_route_table" {
  type        = bool
  default     = true
  description = "allowing db route  table to be created"
}
variable "enable_nat_gateway" {
  type        = bool
  default     = true
  description = "allowing nat gw to be created"
}
variable "single_nat_gateway" {
  type        = bool
  default     = true
  description = "allowing single nat gw to be created"
}
variable "vpc_name" {
  type = string
  description = "vpc name"
  default = "myvpc"
}