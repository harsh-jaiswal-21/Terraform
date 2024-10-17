variable "instance_type" {
  type        = string
  description = "instance types for servers"
}
variable "instance_keypair" {
  type        = string
  description = "keypair for ec2 instances"
}

/* not needed anymore 
variable "private_instance_count" {
  type = number
  description = "private_instance_count for loadbalancer"
} */