# DNS REGESTRATION
resource "aws_route53_record" "default" {
  zone_id = data.aws_route53_zone.mydomain.zone_id
  name    = "myapps.harshcloud.xyz"
  type    = "A"
  # ttl     = 300 Mandatory For NON-ALIAS RECORD
  alias {
    name                   = module.alb.dns_name
    zone_id                = module.alb.zone_id
    evaluate_target_health = true
  }
}
resource "aws_route53_record" "app1_dns" {
  zone_id = data.aws_route53_zone.mydomain.zone_id
  name    = var.app1_dns_name
  type    = "A"
  # ttl     = 300 Mandatory For NON-ALIAS RECORD
  alias {
    name                   = module.alb.dns_name
    zone_id                = module.alb.zone_id
    evaluate_target_health = true
  }
}
resource "aws_route53_record" "app2_dns" {
  zone_id = data.aws_route53_zone.mydomain.zone_id
  name    = var.app2_dns_name
  type    = "A"
  # ttl     = 300 Mandatory For NON-ALIAS RECORD
  alias {
    name                   = module.alb.dns_name
    zone_id                = module.alb.zone_id
    evaluate_target_health = true
  }
}