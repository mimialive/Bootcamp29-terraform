#creating S3 bucket
resource "aws_s3_bucket" "mimi_bucket" {
  bucket = "bootcamp29-23-mimi"

  tags = {
    Name = "bootcamp29-23-mimi"
  }
}

resource "aws_s3_bucket_acl" "s3_acl" {
  bucket = aws_s3_bucket.mimi_bucket.id
  acl    = "private"
}

#creating kms key
resource "aws_kms_key" "kmskey" {
  description             = "This key is used to encrypt bucket objects"
  deletion_window_in_days = 7
}

#enable server side encryption and attach to s3 bucket
resource "aws_s3_bucket_server_side_encryption_configuration" "s3_encryption" {
  bucket = aws_s3_bucket.mimi_bucket.bucket

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.kmskey.arn
      sse_algorithm     = "aws:kms"
    }
  }
}

#enable versioning
resource "aws_s3_bucket_versioning" "s3_versioning" {
  bucket = aws_s3_bucket.mimi_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}