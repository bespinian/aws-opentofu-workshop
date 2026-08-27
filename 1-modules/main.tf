terraform {
  required_version = "~> 1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

data "aws_caller_identity" "current" {}

module "bucket" {
  source = "./bucket"

  # Specify the variables/inputs of this module
  bucket_name = "tofu-${var.participant}-${data.aws_caller_identity.current.account_id}-2"
}

module "configuration" {
  source = "./configuration"

  bucket_id = module.bucket.bucket_id
}
