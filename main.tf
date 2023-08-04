module "vpc" {
  source = "./modules/vpc"

  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
  environment     = "dev"
  vpc_name        = "my-vpc"
  vpc_cidr        = "10.0.0.0/16"
  azs             = ["us-west-2a", "us-west-2b", "us-west-2c"]
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

  cluster_name = "my-eks-cluster"
  vpc_id       = module.vpc.vpc_id
  subnets      = module.vpc.subnet_ids
  key_name     = "my-key-pair"
}


module "s3" {
  source = "./modules/s3"

  artifact_store_bucket_name = "my-artifact-store-bucket"
  source_bucket_name         = "my-source-bucket"
  kms_key_id                 = module.kms.kms_key_arn
}


module "kms" {
  source = "terraform-aws-modules/kms/aws"

  description = "S3 usage"
  key_usage   = "ENCRYPT_DECRYPT"

  # Policy
  key_administrators                 = ["arn:aws:iam::012345678901:role/admin"]
  key_service_roles_for_autoscaling  = ["arn:aws:iam::012345678901:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"]

  # Aliases
  aliases = ["mycompany/ebs"]

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
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
