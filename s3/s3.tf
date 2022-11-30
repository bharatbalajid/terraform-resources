locals {
  bucket-name = "${var.App-name}-${var.Env-name}-blue"
}

resource "aws_s3_bucket" "mybucket" {
  bucket = local.bucket-name
  tags = {
    Name        = local.bucket-name
    Environment = var.Env-name
  }
}
resource "aws_s3_bucket_acl" "mybucket-acl" {
    depends_on = [aws_s3_bucket.mybucket]
    bucket = local.bucket-name
    acl = "private"
  
}
resource "aws_s3_object" "myobject" {
  depends_on = [aws_s3_bucket.mybucket]
  bucket = local.bucket-name
  acl = "private"
  key = "${var.region}/index.html/balaji"
}