resource "aws_s3_bucket" "self" {
  bucket = var.bucket_name

  # Lets `tofu destroy` delete the bucket even if it still holds objects (or,
  # with versioning, old object versions). Fine for a workshop, risky elsewhere.
  force_destroy = true
}
