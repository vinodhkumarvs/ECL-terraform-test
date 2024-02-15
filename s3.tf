resource "aws_s3_bucket" "eb_bucket" {
  bucket_prefix = "${var.application_name}-"
  acl           = "private"

  tags = var.tags
}

resource "aws_s3_bucket_object" "eb_object" {
  bucket = aws_s3_bucket.eb_bucket.id
  key    = "myapp.zip"
  source = "path/to/your/myapp.zip"
  etag   = filemd5("path/to/your/myapp.zip")
}
## this path we need to change accordingly 
## usually whenever we make some changes in webapplication our CICD pipeline will automatically does zip so we can upload it to s3 bucket