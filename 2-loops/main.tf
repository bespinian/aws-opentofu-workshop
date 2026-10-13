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

# We use the modules from the previous lab again. `for_each` makes one copy of
# the module for every suffix in `var.buckets`, and `each.key` is that suffix.
#
# > See: https://opentofu.org/docs/language/meta-arguments/for_each/
module "bucket" {
  source   = "../1-modules/bucket"
  for_each = var.buckets

  bucket_name = "tofu-${var.participant}-${data.aws_caller_identity.current.account_id}-${each.key}"
}

# `module.bucket` is now a map with one entry per suffix. We loop over it, so
# every bucket gets its own configuration. `each.value` is the module's outputs.
module "configuration" {
  source   = "../1-modules/configuration"
  for_each = module.bucket

  bucket_name = each.value.bucket_name
}
