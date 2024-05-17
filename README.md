# Terraform AWS Pre-base Infrastructure

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

1. Install [terraform](https://terraform.io). The required version is stated in [`terraform.meta.tf`](./terraform.meta.tf). You can also use [tfenv](https://github.com/tofuutils/tenv) to automatically get a suitable version.

2. Insert backend config values in `terraform.backend.tfvars`. See [`terraform.backend.remote.tfvars.sample`](./terraform.backend.remote.tfvars.sample) for example, or configure your preferred backend.

3. *(optional)* Login to terraform cloud to use the remote backend:

    ```bash
    terraform login
    ```

4. Install terraform dependencies and initiate the backend:

    ```bash
    terraform init -backend-config=terraform.backend.tfvars
    ```

5. Insert deployment-specific values in `terraform.tfvars`. See [`terraform.tfvars.sample`](./terraform.tfvars.sample) for example.

6. Then execute as:

    ```bash
    terraform apply -var-file=terraform.tfvars
    ```

## Notes

- ⚠️ **This project's state file should not be saved in the same AWS account where it is being deployed.**

- The terraform state is not saved in s3, because it is assumed that no s3 bucket for terraform states exists yet. Instead the [terraform cloud](https://app.terraform.io/) remote backend is used. You may need to setup an account there. Or use local or your preferred backend. You should ensure security of the state file.

- Generated outputs are also saved in a parameter store tree for future reference.
