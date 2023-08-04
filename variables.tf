variable "region" {
  description = "The AWS region"
  type        = string
  default     = "us-west-2"
}

variable "pipeline_name" {
  description = "The name of the pipeline"
  type        = string
}

variable "pipeline_role_arn" {
  description = "The ARN of the IAM role for the pipeline"
  type        = string
}

variable "artifact_store_location" {
  description = "The location of the artifact store"
  type        = string
}

variable "source_bucket" {
  description = "The S3 bucket for the source stage"
  type        = string
}

variable "source_object_key" {
  description = "The S3 object key for the source stage"
  type        = string
}

variable "build_project_name" {
  description = "The name of the CodeBuild project for the build stage"
  type        = string
}

variable "app_name" {
  description = "The name of the CodeDeploy application for the deploy stage"
  type        = string
}

variable "deployment_group_name" {
  description = "The name of the CodeDeploy deployment group for the deploy stage"
  type        = string
}
