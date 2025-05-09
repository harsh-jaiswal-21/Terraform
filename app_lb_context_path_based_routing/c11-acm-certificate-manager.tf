# ACM Module To Create And Verify SSL Certificate
# BEFORE THIS MAKE SURE THAT YOU HAVE HOSTED ZONE ALREADY CRAETED BEFORE ALONG WITH NAME SERVERS ADDED TO GODADDY (THE SITE YOU GOT YOUR DOMAIN FROM)

module "acm" {
  source  = "terraform-aws-modules/acm/aws"
  version = "5.1.1"

  domain_name = trimsuffix(data.aws_route53_zone.mydomain.name, ".")
  zone_id     = data.aws_route53_zone.mydomain.zone_id


  subject_alternative_names = [
    "*.harshcloud.xyz",
  ]

  wait_for_validation = true
  validation_method   = "DNS" # IN THE OLD VERSION VALIDATION_MENTHOD WAS SET ON "DNS" BY DEFAULT BUT IN THIS VERSION IT IS CHANGED TO DEFAULT = NULL

  tags = local.common_tags
}

output "acm_certificate_arn" {
  description = "The ARN of the certificate"
  value       = module.acm.acm_certificate_arn
}