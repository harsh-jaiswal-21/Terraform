terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.72.1"
    }
  }
}

provider "aws" {
  region = "us-east-2"
}