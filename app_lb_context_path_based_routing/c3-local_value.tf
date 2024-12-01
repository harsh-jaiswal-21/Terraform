locals {
  owners = var.bussiness_division[1]
  env    = var.env["E2"]

  name = "${var.bussiness_division[1]}-${var.env["E2"]}"

  common_tags = {
    owners = local.owners
    env    = local.env
  }
}