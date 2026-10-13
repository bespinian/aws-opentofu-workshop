# We specify the provider that OpenTofu will use to interact with the cloud provider
# In this case we use the AWS provider that specifies a large set of AWS resources to utilize.
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

# This is a reference to the Account ID, User ID and ARN with which OpenTofu is authorized.
#
# > See: https://search.opentofu.org/provider/hashicorp/aws/latest/docs/datasources/caller_identity
data "aws_caller_identity" "current" {}
