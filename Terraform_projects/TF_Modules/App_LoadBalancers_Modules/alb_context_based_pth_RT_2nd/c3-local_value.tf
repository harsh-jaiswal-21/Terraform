locals {
  owners = var.bussiness_division["B2"]
  env    = var.enviornment[2]

  name = "${var.bussiness_division["B2"]}-${var.enviornment[2]}"
  common_tags = {
    owner = local.owners
    env   = local.env
  }
}