resource "aws_ssm_parameter" "outputs" {
  for_each = local.parameter_store_outputs

  name  = "${trimsuffix(var.parameter_store_path, "/")}/${each.key}"
  type  = try(each.value.secure, false) ? "SecureString" : "String"
  value = each.value.value
}

locals {
  parameter_store_outputs = {
    s3_bucket_name             = { value = aws_s3_bucket.terraform_state.id }
    dynamodb_table_arn         = { value = aws_dynamodb_table.terraform_lock.arn }
    iam_user_name              = { value = aws_iam_user.iac.name }
    iam_user_arn               = { value = aws_iam_user.iac.arn }
    iam_user_access_key_id     = { value = aws_iam_access_key.iac.id }
    iam_user_access_key_secret = { secure = true, value = nonsensitive(aws_iam_access_key.iac.secret) }
    kms_key_alias              = { value = aws_kms_alias.iac.name }
    kms_key_id                 = { value = aws_kms_key.iac.key_id }
    kms_key_arn                = { value = aws_kms_key.iac.arn }
  }
}
