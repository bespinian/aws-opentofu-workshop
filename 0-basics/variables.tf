variable "aws_region" {
  type        = string
  description = "The AWS region"
  default     = "eu-central-2"
}

variable "participant" {
  type        = string
  description = "Your name in lowercase, e.g. \"anna-mueller\". Bucket names are global, so this keeps yours apart from everyone else's. The workshop VMs set it for you via TF_VAR_participant."

  validation {
    condition     = can(regex("^[a-z0-9]([a-z0-9-]{0,38}[a-z0-9])?$", var.participant))
    error_message = "Use 1-40 lowercase letters, digits and dashes, e.g. \"anna-mueller\"."
  }
}

# This is a reference to the Account ID, User ID and ARN with which Terraform is authorized.
#
# > See: https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity
data "aws_caller_identity" "current" {}
