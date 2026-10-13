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

variable "buckets" {
  type        = set(string)
  description = "One bucket is created for every suffix in this set."
  default     = ["logs", "data"]

  # Bucket names can have at most 63 characters. The start of the name can take
  # up to 58 already, which leaves 1 for the dash and 4 for the suffix.
  validation {
    condition     = alltrue([for suffix in var.buckets : can(regex("^[a-z0-9]{1,4}$", suffix))])
    error_message = "Use 1-4 lowercase letters and digits per suffix, e.g. \"logs\"."
  }
}
