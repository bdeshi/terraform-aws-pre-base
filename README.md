# Terraform AWS Pre-Base

## Intro

This project deploys the basic resources necessary for running multi-user Terraform deployments on an AWS account.

- an s3 bucket for storing terraform states
- a dynamodb table for maintaining terraform locks
- an admin user intended for use in other IaC projects
- a kms key intended for securing other IaC project secrets
- a parameter store tree to keep outputs of this project for reference

This configuration is intended to be manually executed once at the beginning by the root user.

| ⚠️ | Re-deploying this project again after running other AWS IaC projects can be <u>*extremely destructive*</u>. |
|-|-|

## Usage

1. Install [terraform](https://terraform.io) or [opentofu](https://opentofu.org/) (preferably with [tfenv](https://github.com/tfutils/tfenv)). The required version is stated in `terraform.meta.tf`.

2. Install terraform dependencies:

    ```bash
    terraform init -upgrade
    ```

3. Insert org-specific variable values in `<org-name>.tfvars`. See `*.tfvars.sample` for example.

4. Then execute as:

    ```bash
    terraform apply -var-file=<org-name>.tfvars
    ```

## Notes

The terraform state is not saved in s3, because it is assumed that no s3 bucket for terraform states exists yet. User should secure the state file using some other method.

Generated outputs are saved in a parameter store tree for future reference.
