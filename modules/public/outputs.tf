output "bucket_id" {
  value = module.public_bucket.bucket_id
}

output "website_domain" {
  value = module.public_bucket.website_domain
}

output "hosted_zone_id" {
  value = module.public_bucket.hosted_zone_id
}
