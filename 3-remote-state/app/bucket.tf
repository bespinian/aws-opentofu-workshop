resource "aws_s3_bucket" "self" {
  bucket = "tofu-${var.participant}-${data.aws_caller_identity.current.account_id}-app"

  # Lets `tofu destroy` delete the bucket even if it still holds objects (or,
  # with versioning, old object versions). Fine for a workshop, risky elsewhere.
  force_destroy = true

  tags = {
    Name = "My S3 Bucket with remote state"
  }
}
