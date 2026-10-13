# Since April 2023, AWS blocks public access on new buckets by default, so this
# doesn't change anything yet. We still set it to make clear that the bucket
# must stay private, and so OpenTofu undoes it if someone changes it by hand.
#
# > See: https://search.opentofu.org/provider/hashicorp/aws/latest/docs/resources/s3_bucket_public_access_block
#
resource "aws_s3_bucket_public_access_block" "self" {
  bucket                  = var.bucket_name
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# Versioning is off by default, so this is a change you can actually observe.
#
# > See: https://search.opentofu.org/provider/hashicorp/aws/latest/docs/resources/s3_bucket_versioning
#
resource "aws_s3_bucket_versioning" "self" {
  bucket = var.bucket_name

  versioning_configuration {
    status = "Enabled"
  }
}
