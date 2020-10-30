/**
 * # ![AWS](aws-logo.png) S3 Bucket
 *
 * ![AWS S3 Bucket](aws_s3_bucket.png)
 *
 * Purpose: Provision S3 Bucket in AWS.
 *
 * Rationale: Apply standards and constraints to S3 Buckets.
 */
data "aws_caller_identity" "current" {}

resource "aws_s3_bucket" "bucket" {
  count = var.suffix_enabled ? 0 : 1

  bucket = var.bucket
  acl    = var.acl
  policy = var.policy != "" ? local.policies[var.policy] : null

  dynamic "lifecycle_rule" {
    for_each = var.expiration_days > 0 ? [1] : []
    content {
      enabled = true
      expiration {
        date = var.expiration_days
      }
    }
  }

  #checkov:skip=CKV_AWS_21:Dynamic versioning block
  versioning {
    enabled    = var.versioned
    mfa_delete = true
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

  #checkov:skip=CKV_AWS_19:Dynamic encryption block
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

  dynamic "website" {
    for_each = var.website_redirect != "" ? [1] : []
    content {
      redirect_all_requests_to = var.website_redirect
    }
  }
}

resource "aws_s3_bucket_public_access_block" "bucket" {
  count = var.suffix_enabled ? 0 : 1

  bucket                  = aws_s3_bucket.bucket[0].id
  restrict_public_buckets = true
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
}
