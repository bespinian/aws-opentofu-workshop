output "bucket_name" {
  description = "The name of the bucket that holds the state of ../app"
  value       = module.bucket.bucket_name
}
