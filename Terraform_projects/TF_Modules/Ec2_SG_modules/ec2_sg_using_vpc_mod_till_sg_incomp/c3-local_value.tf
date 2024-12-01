locals {
  owners = var.business_division[0]
  enviornment = var.env["env1"]

#  name = "${var.business_division[0]}-${var.env["p1-pmgt"]}"
   name = "${local.owners}-${local.enviornment}"

   common_tags = {
    owners = "${local.owners}"
    enviornment = "${local.enviornment}"
   }

}