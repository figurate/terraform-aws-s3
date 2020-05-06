output "bucket_id" {
  value = aws_s3_bucket.bucket[0].id
}

output "website_domain" {
  value = aws_s3_bucket.bucket[0].website_domain
}

output "hosted_zone_id" {
  value = aws_s3_bucket.bucket[0].hosted_zone_id
}
