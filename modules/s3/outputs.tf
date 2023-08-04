output "artifact_store_bucket_name" {
  description = "The name of the S3 bucket for the artifact store"
  value       = aws_s3_bucket.artifact_store.bucket
}

output "source_bucket_name" {
  description = "The name of the S3 bucket for the source stage"
  value       = aws_s3_bucket.source_bucket.bucket
}
