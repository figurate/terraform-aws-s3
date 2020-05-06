resource "aws_s3_bucket" "prefixed_bucket" {
  count = var.prefix_enabled ? 1 : 0

  bucket_prefix = var.bucket_name
  acl           = "private"

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
}
