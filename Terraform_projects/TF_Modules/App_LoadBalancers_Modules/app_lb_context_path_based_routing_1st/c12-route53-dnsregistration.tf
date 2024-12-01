# DNS REGESTRATION
resource "aws_route53_record" "apps" {
  zone_id = data.aws_route53_zone.mydomain.zone_id
  name    = "apps.harshcloud.xyz"
  type    = "A"
  # ttl     = 300 Mandatory For NON-ALIAS RECORD
  alias {
    name                   = module.alb.dns_name
    zone_id                = module.alb.zone_id
    evaluate_target_health = true
  }
}