# A provider is a plugin that lets OpenTofu talk to a platform. The AWS provider
# knows how to create, change and delete AWS resources.
#
# > See: https://search.opentofu.org/provider/hashicorp/aws/latest/docs

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

# A data source reads something that already exists. This one reads the account
# ID, user ID and ARN of the AWS credentials that OpenTofu uses.
#
# > See: https://search.opentofu.org/provider/hashicorp/aws/latest/docs/datasources/caller_identity
data "aws_caller_identity" "current" {}
