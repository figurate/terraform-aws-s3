data "aws_caller_identity" "current" {}

resource "aws_s3_bucket" "bucket" {
  count = var.suffix_enabled ? 0 : 1

  bucket = var.bucket
  acl    = "private"

  dynamic "lifecycle_rule" {
    for_each = var.expiration_days > 0 ? [1] : []
    content {
      enabled = true
      expiration {
        date = var.expiration_days
      }
    }
  }

  versioning {
    enabled = var.versioned
  }

  dynamic "lifecycle_rule" {
    for_each = var.versioned && var.noncurrent_version_expiration > 0 ? [1] : []
    content {
      enabled = true
      noncurrent_version_expiration {
        days = var.noncurrent_version_expiration
      }
    }
  }

  dynamic "server_side_encryption_configuration" {
    for_each = var.encrypted ? [1] : []
    content {
      rule {
        apply_server_side_encryption_by_default {
          sse_algorithm     = var.encryption_key != "" ? "aws:kms" : "AES256"
          kms_master_key_id = var.encryption_key != "" ? var.encryption_key : null
        }
      }
    }
  }

  dynamic "logging" {
    for_each = var.logging_bucket != "" ? [1] : []
    content {
      target_bucket = var.logging_bucket
      target_prefix = var.bucket
    }
  }
}

resource "aws_s3_bucket_public_access_block" "bucket" {
  bucket                  = aws_s3_bucket.bucket[0].id
  restrict_public_buckets = true
  block_public_acls       = true
  block_public_policy     = true
}
