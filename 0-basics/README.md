# OpenTofu / Terraform Basics

Here we cover the basics of OpenTofu / Terraform, such as:

* Variables and data types,
* Providers,
* Resources and
* Data blocks

## Getting started

Run `tofu init` once in this directory. It downloads the AWS provider and writes a lock file that records its exact version.

Use `tofu plan` to view the changes that OpenTofu would make. Once you are happy with that, use `tofu apply` to create the actual infrastructure objects.

## Exercises

1. Change the `Name` tag in `bucket.tf` and run `tofu plan`. OpenTofu marks the bucket with `~`: it can be updated in place. Apply the change.
2. Run `tofu state list` to see what OpenTofu manages, then `tofu state show aws_s3_bucket.self` to see everything it knows about your bucket.
3. Run `tofu console` and evaluate a few expressions, e.g. `data.aws_caller_identity.current.account_id` or `upper(var.participant)`. Leave with `exit`.
4. Add an `output` block that prints the bucket's name, apply, and run `tofu output`. See the [output docs](https://opentofu.org/docs/language/values/outputs/) if you're stuck.
5. Append `-new` to the bucket name in `bucket.tf` and run `tofu plan`. This time the bucket is marked with `-/+` and `# forces replacement`: S3 can't rename a bucket, so OpenTofu has to delete it and create a new one. Apply it, or revert the change.

## Cleaning up

Run `tofu destroy` when you're done to delete everything this lab created. The next lab is independent of this one.
