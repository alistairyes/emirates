variable "artifact_store_bucket_name" {
  description = "The name of the S3 bucket for the artifact store"
  type        = string
}

variable "source_bucket_name" {
  description = "The name of the S3 bucket for the source stage"
  type        = string
}

variable "kms_key_id" {
  description = "The ARN of the KMS key to be used by the S3 bucket"
  type        = string
}
