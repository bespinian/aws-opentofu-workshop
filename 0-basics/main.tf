# We specify the provider that OpenTofu/Terraform will use to interact with the cloud provider
# In this case we use the AWS provider that specifies a large set of AWS resources to utilize.
#
# > See: https://registry.terraform.io/providers/hashicorp/aws/latest/docs

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
