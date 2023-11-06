resource "aws_kms_key" "iac" {
  description = "IaC secrets encryption key"
}

resource "aws_kms_alias" "iac" {
  target_key_id = aws_kms_key.iac.key_id
  name          = "alias/${var.kms_alias}"
}
