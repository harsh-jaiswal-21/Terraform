output "public_ip_address" {
  value       = aws_instance.this[*].public_ip
  description = "shows public ip of instances"
}
output "public_dns" {
  value       = aws_instance.this[*].public_dns
  description = "shows public dns of instances"
}

output "legacy_splatter" {
  value = aws_instance.this.*.public_dns
}
output "generalized_splatter" {
  value = aws_instance.this[*].public_dns
}
output "for_list" {
  value       = [for xyz in aws_instance.this : xyz.id]
  description = "using for loop for list"
}

output "for_map" {
  value       = { for xyz in aws_instance.this : xyz.id => xyz.public_dns }
  description = "using for loop for maps"
}
output "for_map_adv" {
  value       = { for xyz in aws_instance.this : xyz.id => xyz.public_dns }
  description = "using for loop for maps adv"
}
