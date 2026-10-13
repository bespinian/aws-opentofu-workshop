terraform {
  required_version = "~> 1.10"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }

  # Stores the state in S3 instead of a local terraform.tfstate file. The
  # bucket is missing on purpose: it's different for every participant, so we
  # pass it to `tofu init` with `-backend-config` instead.
  #
  # > See: https://opentofu.org/docs/language/settings/backends/s3/
  backend "s3" {
    key = "3-remote-state/terraform.tfstate"

    # OpenTofu lets you use variables in the backend block.
    region = var.aws_region

    # Writes a lock file next to the state while a command runs, so two runs
    # can't change the state at the same time.
    use_lockfile = true
  }
}

provider "aws" {
  region = var.aws_region
}

data "aws_caller_identity" "current" {}
