resource "aws_codepipeline" "pipeline" {
  name     = var.pipeline_name
  role_arn = var.pipeline_role_arn

  artifact_store {
    location = var.artifact_store_location
    type     = "S3"
  }

  stage {
    name = "Source"

    action {
      name             = "Source"
      category         = "Source"
      owner            = "AWS"
      provider         = "S3"
      version          = "1"
      output_artifacts = ["source_output"]

      configuration = {
        S3Bucket    = var.source_bucket
        S3ObjectKey = var.source_object_key
      }
    }
  }

  stage {
    name = "Build"

    action {
      name             = "Build"
      category         = "Build"
      owner            = "AWS"
      provider         = "CodeBuild"
      input_artifacts  = ["source_output"]
      output_artifacts = ["build_output"]
      version          = "1"

      configuration = {
        ProjectName = var.build_project_name
      }
    }
  }

  stage {
    name = "Deploy"

    action {
      name            = "Deploy"
      category        = "Deploy"
      owner           = "AWS"
      provider        = "CodeDeployToECS"  # or another provider that can deploy to Kubernetes
      input_artifacts = ["build_output"]
      version         = "1"

      configuration = {
        ApplicationName  = var.app_name
        DeploymentGroupName = var.deployment_group_name
      }
    }
  }
}
