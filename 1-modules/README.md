# Modules

In this lab, we use modules. A module is a directory of `.tf` files that you can use from other configurations, a bit like a function. There are two here:

- `bucket` creates an S3 bucket.
- `configuration` blocks public access to the bucket and turns on versioning.

The `configuration` module gets the bucket name from `module.bucket.bucket_name`, an output of the `bucket` module. Because of this reference, OpenTofu knows that it has to create the bucket first. You don't have to set the order yourself.

## Getting started

Open a terminal in the root of this repository and go to this lab's directory:

```sh
cd 1-modules
```

This is a new directory, so run `tofu init` here first. Besides the provider, it also installs the modules in `./bucket` and `./configuration`.

Then run `tofu plan` and `tofu apply` as before.

## Exercises

1. Run `tofu state list`. Resources inside a module start with `module.<name>.`, e.g. `module.bucket.aws_s3_bucket.self`.
2. Run `tofu state show module.configuration.aws_s3_bucket_versioning.self` and check that versioning is `Enabled`.
3. Run `tofu graph | grep module.bucket.output.bucket_name`. `tofu graph` prints one `A -> B` line for every "A depends on B". Find the line that shows that `module.configuration` depends on the output of the `bucket` module.
4. The `bucket` module has a `bucket_arn` output, but you can't see it yet. Add an `output` block to `main.tf` that passes it on, apply, and print it with `tofu output`.
5. Create a second bucket: copy both `module` blocks in `main.tf` and name the copies `bucket_3` and `configuration_3`. End the bucket name with `-3` instead of `-2`, and let `configuration_3` use `module.bucket_3.bucket_name`. Run `tofu plan` and read the error: every new `module` block needs another `tofu init`. Run it, then apply.

## Cleaning up

Run `tofu destroy` when you're done to delete all buckets and their configuration.
