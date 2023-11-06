data "aws_iam_policy" "adminstrator_access" {
  name = "AdministratorAccess"
}

resource "aws_iam_user" "iac" {
  name = var.iac_username
}

resource "aws_iam_user_policy_attachment" "iac_admin_policy" {
  policy_arn = data.aws_iam_policy.adminstrator_access.arn
  user       = aws_iam_user.iac.name
}

resource "aws_iam_access_key" "iac" {
  user = aws_iam_user.iac.name
}
