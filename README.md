# OpenTofu Workshop on AWS

## Prerequisites

* Configured AWS credentials for an account with the Zurich region
  (`eu-central-2`) turned on. AWS turns off newer regions by default, see
  [how to turn them on](https://docs.aws.amazon.com/accounts/latest/reference/manage-acct-regions.html).
* [OpenTofu](https://opentofu.org/docs/intro/install/) 1.10 or newer on your
  machine
* Your name for the `participant` variable, which keeps your bucket names apart
  from everyone else's: `export TF_VAR_participant=anna-mueller`

On the workshop VMs all three are already set up.

## Labs

0. [OpenTofu Basics](./0-basics/)
1. [Modules](./1-modules/)
2. [Loops](./2-loops/)
3. [Remote State](./3-remote-state/)
