resource "aws_s3_bucket" "self" {
  # Bucket names must be unique across all of AWS. `${...}` puts values into the
  # name: the account ID keeps it apart from other accounts, and your name keeps
  # it apart from the other participants in this account.
  bucket = "tofu-${var.participant}-${data.aws_caller_identity.current.account_id}"

  # Lets `tofu destroy` delete the bucket even if it still holds objects. Fine
  # for a workshop, risky elsewhere.
  force_destroy = true

  tags = {
    Name = "My first S3 Bucket"
  }
}
