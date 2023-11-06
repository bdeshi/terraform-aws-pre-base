resource "aws_dynamodb_table" "terraform_lock" {
  name         = "${var.org_name}-${var.dynamodb_table_name_slug}"
  hash_key     = "LockID"
  billing_mode = "PAY_PER_REQUEST"
  # read_capacity  = 1
  # write_capacity = 1
  # capacities are not relevant on on-demand/PAY_PER_REQUEST billing mode
  # capacities are very low since terraform apply shouldn't see heavy use
  attribute {
    name = "LockID"
    type = "S"
  }
}
