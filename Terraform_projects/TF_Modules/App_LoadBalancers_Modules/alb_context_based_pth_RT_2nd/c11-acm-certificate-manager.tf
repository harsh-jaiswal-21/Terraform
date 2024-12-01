module "acm" {
  source  = "terraform-aws-modules/acm/aws"
  version = "5.1.1"

  domain_name = data.aws_route53_zone.mydomain.name
  zone_id     = data.aws_route53_zone.mydomain.zone_id

  validation_method = "DNS" # This arg used to be default validation_method = "DNS" but now in current version default = null

  subject_alternative_names = [
    "*.harshcloud.xyz",
  ]

  wait_for_validation = true

  tags = local.common_tags
}
output "acm_certificate_arn" {
  description = "The ARN of the certificate"
  value       = module.acm.acm_certificate_arn
}