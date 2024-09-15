locals {
  owner       = var.business_division["o1"]
  enviornment = var.env[2]

  #  name = "${local.owner}-${local.enviornment}"
  name = "${var.business_division["o1"]}-${var.env[2]}"
  common_tags = {
    owners      = local.owner
    enviornment = local.enviornment
  }
}