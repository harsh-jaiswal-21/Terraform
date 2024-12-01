output "public_ip_list" {
    value = [for instance in aws_instance.machine: instance.public_ip]
    description = "printing each instance public ip"
}

output "public_ip_maps" {
    value = {for arg, instance in aws_instance.machine: arg => instance.public_ip}
    description = "printing each instance public ip"
}

output "public_dns_list" {
    value = [for instance in aws_instance.machine: instance.public_dns]
    description = "printing each instance public ip"
}
