# OpenTofu Basics

In this lab, we cover the basics of OpenTofu:

- Variables and data types
- Providers
- Resources
- Data sources

## Getting started

Run `tofu init` once in this directory. It downloads the AWS provider and writes a lock file that records its exact version.

Run `tofu plan` to see what OpenTofu would change. If you're happy with that, run `tofu apply` to create the bucket. OpenTofu writes down what it created in a state file, `terraform.tfstate`.

## Exercises

1. Change the `Name` tag in `bucket.tf` and run `tofu plan`. OpenTofu marks the bucket with `~`, which means it can change the bucket without replacing it. Apply the change.
2. Run `tofu state list` to see what OpenTofu manages, then `tofu state show aws_s3_bucket.self` to see everything it knows about your bucket.
3. Run `tofu console` and try a few expressions, e.g. `data.aws_caller_identity.current.account_id` or `upper(var.participant)`. Leave with `exit`.
4. Add an `output` block that prints the bucket's name, apply, and run `tofu output`. See the [output docs](https://opentofu.org/docs/language/values/outputs/) if you're stuck.
5. Add `-new` to the end of the bucket name in `bucket.tf` and run `tofu plan`. This time the bucket is marked with `-/+` and `# forces replacement`: S3 can't rename a bucket, so OpenTofu has to delete it and create a new one. Apply it, or undo the change.

## Cleaning up

Run `tofu destroy` when you're done to delete everything this lab created. The next lab doesn't need anything from this one.
