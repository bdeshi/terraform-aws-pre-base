resource "aws_s3_bucket" "terraform_state" {
  bucket_prefix = var.s3_bucket_use_random_suffix ? "${var.org_name}-${var.s3_bucket_name_slug}" : null
  bucket        = !var.s3_bucket_use_random_suffix ? "${var.org_name}-${var.s3_bucket_name_slug}" : null
  force_destroy = false
}

resource "aws_s3_bucket_versioning" "terraform_state" {
  bucket = aws_s3_bucket.terraform_state.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_lifecycle_configuration" "terraform_state" {
  bucket = aws_s3_bucket.terraform_state.id

  rule {
    id     = "general-cleanup"
    status = "Enabled"
    filter {
      prefix = ""
    }
    abort_incomplete_multipart_upload {
      days_after_initiation = 7
    }
    expiration {
      expired_object_delete_marker = true
    }
  }

  dynamic "rule" {
    for_each = var.s3_enable_versioning ? [1] : []
    content {
      id     = "versions-transition"
      status = "Enabled"
      filter {
        and {
          prefix                   = ""
          object_size_greater_than = 128 * 1024
        }
      }
      noncurrent_version_transition {
        noncurrent_days = 30
        storage_class   = "STANDARD_IA"
      }
    }
  }

  dynamic "rule" {
    for_each = var.s3_enable_versioning ? [1] : []
    content {
      id     = "versions-expiration"
      status = "Enabled"
      filter {
        prefix = ""
      }
      noncurrent_version_expiration {
        noncurrent_days           = 60
        newer_noncurrent_versions = var.s3_version_limit
      }
    }
  }
}
