# OpenTofu Workshop on AWS

## Prerequisites

* Configured AWS credentials
* [OpenTofu](https://opentofu.org/docs/intro/install/) on your machine 
* Your name for the `participant` variable, which keeps your bucket names apart
  from everyone else's: `export TF_VAR_participant=anna-mueller`

On the workshop VMs all three are already set up.

<details>
    <summary><span style="font-size: 8px">psst.</span></summary>
    <br/>
    <small>Or just</small>
        <pre style="font-size: 10px">nix develop</pre>
    <small>but this ain't no Nix workshop</small>
</details>

## Labs

0. [Terraform Basics](./0-basics/README.md)
1. [Modules](./1-modules/README.md)
