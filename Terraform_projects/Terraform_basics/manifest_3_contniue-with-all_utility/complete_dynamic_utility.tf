data "aws_ec2_instance_type_offerings" "xyz" {
  for_each = toset(data.aws_availability_zones.cont-2.names)
  filter {
    name   = "instance-type"
    values = ["t3.micro"]
  }

  filter {
    name   = "location"
    values = [each.key]
  }

  location_type = "availability-zone"
}


data "aws_availability_zones" "cont-2" {
  filter {
    name   = "opt-in-status"
    values = ["opt-in-not-required"]
  }
}

output "complete_checker" {
    value = {for c , instance in data.aws_ec2_instance_type_offerings.xyz: c => instance.instance_types}
    description = "printing instance types availablity in az's"
}
output "if_condition" {
    value = {for c , instance in data.aws_ec2_instance_type_offerings.xyz: c => instance.instance_types
    if length(instance.instance_types) !=0}
    description = "printing instance types availablity in az's"
}
output "keys" {
    value = keys({for c , instance in data.aws_ec2_instance_type_offerings.xyz: c => instance.instance_types
    if length(instance.instance_types) !=0})
    description = "printing instance types availablity in az's"
}
output "first_key" {
    value = keys({for c , instance in data.aws_ec2_instance_type_offerings.xyz: c => instance.instance_types
    if length(instance.instance_types) !=0})[0]
    description = "printing instance types availablity in az's first key"
}
