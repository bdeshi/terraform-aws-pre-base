output "org_name" {
  value = var.org_name
}

output "aws_account_id" {
  value = data.aws_caller_identity.current.account_id
}

output "ssm_parameter_store_path" {
  value = "${trimsuffix(var.parameter_store_path, "/")}/"
}

output "s3_bucket_name" {
  value = aws_s3_bucket.terraform_state.id
}

output "dynamodb_table_name" {
  value = aws_dynamodb_table.terraform_lock.id
}

output "dynamodb_table_arn" {
  value = aws_dynamodb_table.terraform_lock.arn
}

output "iam_user_arn" {
  value = aws_iam_user.iac.arn
}

output "iam_user_name" {
  value = aws_iam_user.iac.name
}

output "iam_user_access_key_id" {
  value = aws_iam_access_key.iac.id
}

output "iam_user_access_key_secret" {
  value = nonsensitive(aws_iam_access_key.iac.secret)
}

output "kms_key_arn" {
  value = aws_kms_key.iac.arn
}

output "kms_key_id" {
  value = aws_kms_key.iac.key_id
}

output "kms_key_alias" {
  value = aws_kms_alias.iac.name
}
