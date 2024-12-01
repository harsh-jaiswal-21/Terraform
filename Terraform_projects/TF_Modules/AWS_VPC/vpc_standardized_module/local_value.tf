locals {
  owners = var.business_division
  env    = var.Enviornment[1]

  # name = "${var.business_division}-${var.Enviornment[1]}"
  name = "${local.owners}-${local.env}"

  common_tags = {
    owners = "${local.owners}"
    env    = "${local.env}"
  }
}