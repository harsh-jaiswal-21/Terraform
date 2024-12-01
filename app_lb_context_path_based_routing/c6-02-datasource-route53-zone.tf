# Get DNS Information For 
data "aws_route53_zone" "mydomain" {
  name = "harshcloud.xyz"
  # private_zone = true
}

# Output For Zone ID Of MY RT 53
output "DOMAINS_ZONEID" {
  value       = data.aws_route53_zone.mydomain.zone_id
  description = "Hosted Zone id of the desired Hosted Zone"
}
output "DOMAINS_NAME" {
  value       = data.aws_route53_zone.mydomain.name
  description = "Hosted Zone id of the desired Hosted Zone"
}