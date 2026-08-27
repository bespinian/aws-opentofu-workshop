output "bucket_id" {
  description = "The ID of the newly created bucket"
  value       = aws_s3_bucket.self.bucket
}

output "bucket_arn" {
  description = "The ARN of the newly created bucket"
  value       = aws_s3_bucket.self.arn
}
