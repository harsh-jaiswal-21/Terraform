output "public_ip_list" {
    value = toset([for instance in aws_instance.bvm: instance.public_ip])
    description = "printing public ip for all instance as list using for loop"
}
output "public_ip_maps" {
    value = tomap({for az, instance in aws_instance.bvm: instance.id => instance.public_ip})
    description = "printing public ip for all instance as list using for loop"
}