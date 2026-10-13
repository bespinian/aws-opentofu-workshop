# A `for` expression turns the map of module instances into a map of names.
#
# > See: https://opentofu.org/docs/language/expressions/for/
output "bucket_names" {
  description = "The name of every bucket, by suffix"
  value       = { for suffix, bucket in module.bucket : suffix => bucket.bucket_name }
}
