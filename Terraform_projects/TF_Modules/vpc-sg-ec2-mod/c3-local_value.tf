locals {

  owners      = var.bussiness_division[0]
  enviornment = var.env["EV3"]

  Name = "${var.bussiness_division[0]}-${var.env["EV3"]}"

  common_tags = {
    owners = local.owners
    env    = local.enviornment
  }
}