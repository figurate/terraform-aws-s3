module "public_bucket" {
  source = "../.."

  bucket                        = var.bucket
  acl                           = "public-read"
  policy                        = var.policy
  suffix_enabled                = var.suffix_enabled
  expiration_days               = var.expiration_days
  versioned                     = var.versioned
  noncurrent_version_expiration = var.noncurrent_version_expiration
  encrypted                     = var.encrypted
  encryption_key                = var.encryption_key
  logging_bucket                = var.logging_bucket
  public_read_whitelist         = var.public_read_whitelist
  website_redirect              = var.website_redirect
}
