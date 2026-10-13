# Modules

In this section, we cover modules. There is one that creates an S3 bucket (`bucket`) and one that configures (`configuration`) it. The module that configures the bucket restricts public access to the bucket and turns on versioning.

## Getting started

This is a new root module, so run `tofu init` here before anything else. Besides the provider, it also installs the local modules `./bucket` and `./configuration`.

Then run `tofu plan` and `tofu apply` as before.

## Exercises

1. Run `tofu state list`. Resources inside a module are addressed with a `module.<name>.` prefix, e.g. `module.bucket.aws_s3_bucket.self`.
2. Run `tofu state show module.configuration.aws_s3_bucket_versioning.self` to check that versioning is `Enabled`.
3. The `bucket` module outputs `bucket_arn`, but the root module doesn't pass it on. Add a root `output` that does, and print it with `tofu output`.
4. Use the `bucket` and `configuration` modules a second time to create another bucket (end its name with `-3` instead of `-2`). Run `tofu plan` and read the error: every new module call needs another `tofu init`.

## Cleaning up

Run `tofu destroy` when you're done to delete all buckets and their configuration.
