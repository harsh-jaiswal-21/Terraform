locals {
  owner       = var.business_division[0]
  enviornment = var.env["E1"]

  name = "${var.business_division[0]}-${var.env["E1"]}"
  common_tags = {
    owner       = local.owner
    enviornment = local.enviornment
  }
}