module "website" {
  source = "../.."

  bucket                        = var.bucket
  acl                           = "public-read"
  policy                        = var.policy
  suffix_enabled                = var.suffix_enabled
  versioned                     = var.versioned
  noncurrent_version_expiration = var.noncurrent_version_expiration
  logging_bucket                = var.logging_bucket
  public_read_whitelist         = var.public_read_whitelist
}
