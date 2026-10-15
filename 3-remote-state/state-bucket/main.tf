terraform {
  required_version = "~> 1.10"

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

# The modules from lab 1 already do what a state bucket needs: versioning keeps
# every old state around, and the public access block keeps it private.
module "bucket" {
  source = "../../1-modules/bucket"

  bucket_name = "tofu-${var.participant}-${data.aws_caller_identity.current.account_id}-tfst"
}

module "configuration" {
  source = "../../1-modules/configuration"

  bucket_name = module.bucket.bucket_name
}
