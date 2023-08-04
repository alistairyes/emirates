output "kms_key_arn" {
  description = "The ARN of the KMS key"
  value       = aws_kms_key.s3.arn
}
