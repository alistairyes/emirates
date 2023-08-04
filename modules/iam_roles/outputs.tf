output "pipeline_role_arn" {
  description = "The ARN of the IAM role for the pipeline"
  value       = aws_iam_role.pipeline_role.arn
}
