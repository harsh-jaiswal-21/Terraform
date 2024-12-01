data "aws_route53_zone" "mydomain" {
  name = "harshcloud.xyz"
  # private_zone = true
}
output "RT53_zoneid" {
  value       = data.aws_route53_zone.mydomain.zone_id
  description = "The Hosted Zone id of the desired Hosted Zone"
}
output "RT53_name" {
  value       = data.aws_route53_zone.mydomain.name
  description = "The Hosted Zone id of the desired Hosted Zone"
}