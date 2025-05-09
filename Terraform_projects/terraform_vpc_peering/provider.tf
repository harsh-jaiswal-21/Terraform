terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 5.94.1"
    }
  }
}

provider "aws" {
  alias = "ohio"
  region = var.aws_region_ohio
}