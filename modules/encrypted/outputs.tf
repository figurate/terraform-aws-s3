output "bucket_id" {
  value = module.encrypted_bucket.bucket_id
}

output "website_domain" {
  value = module.encrypted_bucket.website_domain
}

output "hosted_zone_id" {
  value = module.encrypted_bucket.hosted_zone_id
}
