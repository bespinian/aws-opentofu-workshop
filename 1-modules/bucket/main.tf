resource "aws_s3_bucket" "self" {
  bucket = var.bucket_name

  tags = {
    Name = "My second S3 Bucket"
  }
}
