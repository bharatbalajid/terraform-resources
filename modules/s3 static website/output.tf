output "s3_domain" {
  value = aws_s3_bucket.my_bucket.website_endpoint
}