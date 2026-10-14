# Remote State

So far, OpenTofu kept its state in a `terraform.tfstate` file in the lab directory. That's fine as long as you work alone. In a team, everyone needs the same state, and two people must not change it at the same time.

In this lab, we keep the state in an S3 bucket instead. There are two directories:

- `state-bucket` creates the bucket for the state. Its own state stays on your machine, because it can't be stored in a bucket that doesn't exist yet.
- `app` creates a bucket like in lab 0, but keeps its state in the state bucket.

The state bucket has versioning turned on, so S3 keeps every old version of the state. If the state ever breaks, you can go back to an earlier one.

## Getting started

Open a terminal in the root of this repository and go to this lab's directory:

```sh
cd 3-remote-state
```

First, create the state bucket:

```sh
cd state-bucket
tofu init
tofu apply
```

Then go to `app` and run `tofu init` with the name of the state bucket:

```sh
cd ../app
tofu init -backend-config="bucket=$(tofu -chdir=../state-bucket output -raw bucket_name)"
```

The part in `$( )` reads the `bucket_name` output of `state-bucket`. After that, run `tofu plan` and `tofu apply` as before.

## Exercises

1. Run `ls` in `app`. There's no `terraform.tfstate` file. Run `tofu state pull` to print the state, which OpenTofu downloads from S3.
2. Delete the `.terraform` directory in `app` and run the `tofu init` command from above again. A colleague would do the same on their machine. Then run `tofu plan`. It shows no changes, because the state was in S3 all along.
3. Open a second terminal and go to the `app` directory. On your own machine, run `export TF_VAR_participant=...` there too. Change the `Name` tag in `bucket.tf`, because `tofu apply` only asks its question if there's something to change. Run `tofu apply` in the first terminal, but don't answer its question yet. Run `tofu plan` in the second terminal. It fails with `Error acquiring the state lock`, because the first terminal holds the lock. Answer `no` in the first terminal, and `tofu plan` works again.
4. Move the state back to your machine: comment out the `backend "s3"` block in `main.tf` and run `tofu init -migrate-state`. Answer `yes`. There's a `terraform.tfstate` file in `app` again. Then remove the comments and run the `tofu init` command from above with `-migrate-state` at the end to move the state back to S3. Answer `yes` to every question.

## Cleaning up

Delete `app` first, because its state lives in the state bucket:

```sh
cd app
tofu destroy
cd ../state-bucket
tofu destroy
```
