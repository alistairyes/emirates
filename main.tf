module "vpc" {
  source = "./modules/vpc"
  // pass in necessary variables here
}

resource "aws_dx_connection" "example" {
  name      = "tf-dx-connection"
  bandwidth = "1Gbps"
  location  = "EqDC2"
}

resource "aws_subnet" "example" {
  vpc_id     = aws_vpc.example.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-west-2-lax-1a"
}


module "eks" {
  source = "./modules/eks"
  // pass in necessary variables here
}

module "s3" {
  source = "./modules/s3"

  artifact_store_bucket_name = "my-artifact-store-bucket"
  source_bucket_name         = "my-source-bucket"
  kms_key_id                 = module.kms.kms_key_arn
}


module "kms" {
  source = "./modules/kms"

  account_id = "your-account-id"
}


module "codepipeline" {
  source = "./modules/codepipeline"

  pipeline_name           = var.pipeline_name
  pipeline_role_arn       = var.pipeline_role_arn
  artifact_store_location = module.s3.artifact_store_bucket_name
  source_bucket           = module.s3.source_bucket_name
  source_object_key       = var.source_object_key
  build_project_name      = var.build_project_name
  app_name                = var.app_name
  deployment_group_name   = var.deployment_group_name
}
