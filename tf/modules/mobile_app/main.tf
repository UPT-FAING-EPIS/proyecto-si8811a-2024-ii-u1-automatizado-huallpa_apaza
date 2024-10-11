resource "aws_s3_bucket" "flutter_app_bucket" {
  bucket = var.app_bucket_name
}

resource "aws_s3_bucket_website_configuration" "flutter_app_website" {
  bucket = aws_s3_bucket.flutter_app_bucket.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "index.html"
  }
}

resource "aws_s3_bucket_public_access_block" "flutter_app_public_access" {
  bucket = aws_s3_bucket.flutter_app_bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "flutter_app_bucket_policy" {
  bucket = aws_s3_bucket.flutter_app_bucket.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "PublicReadGetObject"
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource  = "${aws_s3_bucket.flutter_app_bucket.arn}/*"
      },
    ]
  })
}