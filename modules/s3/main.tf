resource "aws_s3_bucket" "artifact_store" {
  bucket = var.artifact_store_bucket_name
  acl    = "private"

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = var.kms_key_id
        sse_algorithm     = "aws:kms"
      }
    }
  }

  tags = {
    Name        = var.artifact_store_bucket_name
    Environment = var.environment
  }
}

resource "aws_s3_bucket_versioning" "artifact_store" {
  bucket = aws_s3_bucket.artifact_store.id
  status = "Enabled"
}
