resource "aws_s3_bucket" "my_bucket" {
  bucket        = var.bucket_name
  tags          = var.bucket_tags
  force_destroy = true
}
resource "aws_s3_bucket_acl" "my_bucket_acl" {
  bucket = aws_s3_bucket.my_bucket.id
  acl    = "public-read"
}
resource "aws_s3_bucket_website_configuration" "mys3web" {
  bucket = aws_s3_bucket.my_bucket.id
  index_document {
    suffix = "index.html"
  }
  error_document {
    key = "error.html"
  }
}
resource "aws_s3_bucket_policy" "mybs" {
  bucket = aws_s3_bucket.my_bucket.id
  policy = <<EOF
    {
  "Version": "2012-10-17",
  "Statement": [
      {
          "Sid": "PublicReadGetObject",
          "Effect": "Allow",
          "Principal": "*",
          "Action": [
              "s3:GetObject"
          ],
          "Resource": [
              "arn:aws:s3:::${var.bucket_name}/*"
          ]
      }
  ]
} 
  EOF
}
