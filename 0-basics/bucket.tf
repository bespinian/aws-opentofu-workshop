resource "aws_s3_bucket" "self" {
  bucket = "tofu-${var.participant}-${data.aws_caller_identity.current.account_id}"
  # We use string-interpolation because the bucket name has to be globally-unique:
  # the account ID separates accounts, your name separates you from the others in it

  tags = {
    Name = "My first S3 Bucket"
  }
}
