resource "aws_s3_bucket" "self" {
  bucket = "tofu-${var.participant}-${data.aws_caller_identity.current.account_id}"
  # We use string-interpolation because the bucket name has to be globally-unique:
  # the account ID separates accounts, your name separates you from the others in it

  # Lets `tofu destroy` delete the bucket even if it still holds objects (or,
  # with versioning, old object versions). Fine for a workshop, risky elsewhere.
  force_destroy = true

  tags = {
    Name = "My first S3 Bucket"
  }
}
