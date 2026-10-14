# Loops

In the last exercise of the previous lab, you created a second bucket by copying both `module` blocks. With ten buckets, that's a lot of copying. In this lab, we use `for_each` instead: we write each `module` block once, and OpenTofu makes one copy of it for every suffix in the `buckets` variable.

We don't write new modules for this. `source = "../1-modules/bucket"` uses the ones from the previous lab again.

OpenTofu also has `count`. It numbers the copies `[0]`, `[1]`, `[2]`, and so on. If you remove one from the middle, the ones after it get new numbers, and OpenTofu deletes and recreates their buckets. `for_each` names each copy by its key instead, e.g. `["logs"]`, so removing one doesn't affect the others.

## Getting started

Open a terminal in the root of this repository and go to this lab's directory:

```sh
cd 2-loops
```

Run `tofu init` here. Then run `tofu plan` and `tofu apply` as before.

## Exercises

1. Run `tofu state list`. Every copy of a module has its key in its address, e.g. `module.bucket["logs"].aws_s3_bucket.self`.
2. Add `"web"` to the default of `buckets` in `variables.tf` and run `tofu plan`. OpenTofu only adds the new bucket and its configuration. This time you don't need another `tofu init`, because you didn't add a new `module` block. Apply it.
3. Remove `"logs"` from `buckets` and run `tofu plan`. OpenTofu only deletes that bucket and its configuration. The others keep their keys, so nothing happens to them. Apply it.
4. Run `tofu console` and type `module.bucket` to see what `for_each` creates: a map with one entry per suffix. Then try `[for bucket in module.bucket : bucket.bucket_arn]` and the shorter `values(module.bucket)[*].bucket_arn`. Both give the same list. Leave with `exit`.
5. Add the suffix `"images"` and run `tofu plan`. The `validation` block in `variables.tf` rejects it, because S3 bucket names can't be longer than 63 characters.

## Cleaning up

Run `tofu destroy` when you're done to delete all buckets and their configuration.
