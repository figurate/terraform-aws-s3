module "encrypted_bucket" {
  source = "../.."

  bucket_name = var.bucket_name
  prefix_enabled = var.prefix_enabled
  expiration_days = var.expiration_days
  versioned = var.versioned
  noncurrent_version_expiration = var.noncurrent_version_expiration
  encryption_key = var.encryption_key
}
