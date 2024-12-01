resource "aws_route53_record" "my_recs" {
  zone_id = data.aws_route53_zone.mydomain.zone_id
  name    = "apps.harshcloud.xyz"
  type    = "A"
  #  ttl     = 300 Not Mandatory As we are creating alias 
  alias {
    name                   = module.alb.dns_name
    zone_id                = module.alb.zone_id
    evaluate_target_health = true
  }
}