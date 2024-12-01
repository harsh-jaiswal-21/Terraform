variable "aws_region" {
    type = string
    description = "Region For Aws To Provision"
    default = "us-east-1"
}

variable "instance_type_list" {
    type = list(string)
    description = "instance types passed as list"
    default = ["t3.micro" , "t2.micro" , "t3.medium"]
}

variable "instance_type_maps" {
    type = map(string)
    description = "instance types passed as maps"
    default = {
        "dev" = "t3.micro"
        "qa" = "t2.micro"
        "prod" = "c5.large"
    }
}
variable "key_name" {
    type = string
    description = "key nigga region"
    default = "terraform-key-us1"
}