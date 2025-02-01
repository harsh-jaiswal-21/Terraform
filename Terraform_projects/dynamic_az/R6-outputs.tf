#1 basic outputs
output "output_V3_1" {
  value = [for type in data.aws_ec2_instance_type_offerings.myofferings : type.instance_types]
}

#2 all avalablity zones mapped to supported instance types
output "supported_azones_for_instance_types" {
  value = { for az, instance in data.aws_ec2_instance_type_offerings.myofferings : az => instance.instance_types }
}

#3 Filtered Output: Removes avalablity zones that dont support our instance_types
output "Filtered_azones_for_instance_types" {
  value = {for az, details in data.aws_ec2_instance_type_offerings.myofferings : az => details.instance_types if length(details.instance_types) != 0}
}

#4 Filtered Output: Prints only keys 
output "Filtered_azones_for_instance_types_only_keys" {
  value = keys({for az, details in data.aws_ec2_instance_type_offerings.myofferings : az => details.instance_types if length(details.instance_types) != 0})
}  # Keys function returns the list of keys from that map

#5 as our output is list now we can get whatever value we want from list
output "Filtered_azones_for_instance_types_specific_azs" {
  value = keys({for az, details in data.aws_ec2_instance_type_offerings.myofferings : az => details.instance_types if length(details.instance_types) != 0})[0]
}