<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.6.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.19.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.19.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_dynamodb_table.terraform_lock](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/dynamodb_table) | resource |
| [aws_iam_access_key.iac](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_access_key) | resource |
| [aws_iam_user.iac](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user) | resource |
| [aws_iam_user_policy_attachment.iac_admin_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user_policy_attachment) | resource |
| [aws_kms_alias.iac](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_alias) | resource |
| [aws_kms_key.iac](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key) | resource |
| [aws_s3_bucket.terraform_state](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_lifecycle_configuration.terraform_state](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_lifecycle_configuration) | resource |
| [aws_s3_bucket_versioning.terraform_state](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_versioning) | resource |
| [aws_ssm_parameter.outputs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy.adminstrator_access](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | aws region where resources will be created | `string` | n/a | yes |
| <a name="input_dynamodb_table_name_slug"></a> [dynamodb\_table\_name\_slug](#input\_dynamodb\_table\_name\_slug) | base name slug of the dynamodb table to create; this prefixed by `var.org_name` | `string` | `"terraform-locks"` | no |
| <a name="input_git_project"></a> [git\_project](#input\_git\_project) | git source of this project; used in resource tags | `string` | `""` | no |
| <a name="input_iac_username"></a> [iac\_username](#input\_iac\_username) | IAM user to create with admin access; for use by subsequent IaC projects | `string` | `"iac"` | no |
| <a name="input_kms_alias"></a> [kms\_alias](#input\_kms\_alias) | alias of the kms key to create | `string` | `"iac"` | no |
| <a name="input_org_name"></a> [org\_name](#input\_org\_name) | organization name; used in various resource identifiers | `string` | n/a | yes |
| <a name="input_parameter_store_path"></a> [parameter\_store\_path](#input\_parameter\_store\_path) | the parameter store path where outputs will be added for reference | `string` | `"/iac/terraform/pre-base/"` | no |
| <a name="input_s3_bucket_name_slug"></a> [s3\_bucket\_name\_slug](#input\_s3\_bucket\_name\_slug) | base name slug of the s3 bucket to create; this prefixed by `var.org_name` | `string` | `"terraform-states"` | no |
| <a name="input_s3_enable_versioning"></a> [s3\_enable\_versioning](#input\_s3\_enable\_versioning) | whether to enable object versioning on the created bucket | `bool` | `true` | no |
| <a name="input_s3_use_name_suffix"></a> [s3\_use\_name\_suffix](#input\_s3\_use\_name\_suffix) | whether to add random suffix to bucket name, or assume the generated name is unique | `bool` | `false` | no |
| <a name="input_s3_version_limit"></a> [s3\_version\_limit](#input\_s3\_version\_limit) | how many noncurrent versions of s3 objects to retain; max 100 | `number` | `100` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_aws_account_id"></a> [aws\_account\_id](#output\_aws\_account\_id) | n/a |
| <a name="output_dynamodb_table_arn"></a> [dynamodb\_table\_arn](#output\_dynamodb\_table\_arn) | n/a |
| <a name="output_dynamodb_table_name"></a> [dynamodb\_table\_name](#output\_dynamodb\_table\_name) | n/a |
| <a name="output_iam_user_access_key_id"></a> [iam\_user\_access\_key\_id](#output\_iam\_user\_access\_key\_id) | n/a |
| <a name="output_iam_user_access_key_secret"></a> [iam\_user\_access\_key\_secret](#output\_iam\_user\_access\_key\_secret) | n/a |
| <a name="output_iam_user_arn"></a> [iam\_user\_arn](#output\_iam\_user\_arn) | n/a |
| <a name="output_iam_user_name"></a> [iam\_user\_name](#output\_iam\_user\_name) | n/a |
| <a name="output_kms_key_alias"></a> [kms\_key\_alias](#output\_kms\_key\_alias) | n/a |
| <a name="output_kms_key_arn"></a> [kms\_key\_arn](#output\_kms\_key\_arn) | n/a |
| <a name="output_kms_key_id"></a> [kms\_key\_id](#output\_kms\_key\_id) | n/a |
| <a name="output_org_name"></a> [org\_name](#output\_org\_name) | n/a |
| <a name="output_s3_bucket_name"></a> [s3\_bucket\_name](#output\_s3\_bucket\_name) | n/a |
| <a name="output_ssm_parameter_store_path"></a> [ssm\_parameter\_store\_path](#output\_ssm\_parameter\_store\_path) | n/a |
<!-- END_TF_DOCS -->