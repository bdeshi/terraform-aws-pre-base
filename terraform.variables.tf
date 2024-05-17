variable "org_name" {
  type        = string
  description = "organization name; used in various resource identifiers"
}

variable "git_project" {
  type        = string
  description = "git source of this project; used in resource tags"
  default     = ""
}

variable "aws_region" {
  type        = string
  description = "aws region where resources will be created"
}

variable "iac_username" {
  type        = string
  description = "IAM user to create with admin access; for use by subsequent IaC projects"
  default     = "iac"
}

variable "kms_alias" {
  type        = string
  description = "alias of the kms key to create"
  default     = "iac"
}

variable "s3_bucket_name_slug" {
  type        = string
  description = "base name slug of the s3 bucket to create; this prefixed by `var.org_name`"
  default     = "terraform-states"
}

variable "dynamodb_table_name_slug" {
  type        = string
  description = "base name slug of the dynamodb table to create; this prefixed by `var.org_name`"
  default     = "terraform-locks"
}

variable "s3_bucket_use_random_suffix" {
  type        = bool
  description = "whether to add random suffix to bucket name, or assume the generated name is unique"
  default     = false
}

variable "s3_enable_versioning" {
  type        = bool
  description = "whether to enable object versioning on the created bucket"
  default     = true
}

variable "s3_version_limit" {
  type        = number
  description = "how many noncurrent versions of s3 objects to retain; max 100"
  default     = 100
  validation {
    condition     = 0 <= var.s3_version_limit && var.s3_version_limit <= 100
    error_message = "S3 noncurrent version limit must be between 0 to 100"
  }
}

variable "parameter_store_path" {
  type        = string
  description = "the parameter store path where outputs will be added for reference"
  default     = "/iac/terraform/pre-base/"
}
