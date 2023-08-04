# NorthStar Airliness Flight Booking System Infrastructure

This repository contains the Infrastructure as Code (IaC) setup for the NorthStar Airliness Flight Booking System. The infrastructure is built using Terraform, which allows for reliable and repeatable infrastructure deployments.

## Target State Architecture

The target state architecture is designed to provide a stable, scalable, and highly available environment for the NorthStar Airliness Flight Booking System. The architecture includes:

- A Virtual Private Cloud (VPC) with private and public subnets spread across multiple Availability Zones (AZs) for high availability.
- An Amazon EKS cluster for running the application in a Kubernetes environment.
- An AWS CodePipeline for continuous integration and continuous deployment (CI/CD) of the application.
- An AWS S3 bucket for storing the application artifacts and another S3 bucket for storing the source code.
- An AWS KMS key for encrypting the S3 buckets.
- AWS Direct Connect for secure and reliable network connection to an on-premise data center for fetching flight pricing data.
- AWS Local Zones for bringing application data closer to the end-users for low latency.

### AWS Local Zones

AWS Local Zones are a type of AWS infrastructure deployment that places AWS compute, storage, database, and other select services closer to large population, industry, and IT centers. They support the same AWS services, APIs, and toolsets. AWS Local Zones are perfect for latency-sensitive applications, and in our case, it helps to bring the flight booking data closer to the users, providing them with a better user experience.

## Automation Opportunities and Migration Approaches

Automation is a key component of this setup. The entire infrastructure is defined as code using Terraform, which allows for automated creation, updating, and deletion of resources. This approach ensures consistency and repeatability, reduces the risk of human error, and greatly speeds up the deployment process.

The migration to this new infrastructure can be done in a phased manner. First, the VPC and networking components can be set up. Then, the EKS cluster can be created and the application can be deployed in a test environment. Once everything is tested and working as expected, the application can be deployed to the production environment.

The tools used in this setup include:

- **Terraform**: For infrastructure as code and automation.
- **AWS EKS**: For running the application in a Kubernetes environment.
- **AWS CodePipeline**: For continuous integration and continuous deployment.
- **AWS S3**: For storing application artifacts and source code.
- **AWS KMS**: For encryption of S3 buckets.
- **AWS Direct Connect**: For network connection to on-premise data center.
- **AWS Local Zones**: For low latency data access.

## Single Source of Truth and Multiple Pipelines

GitHub is used as the single source of truth for both the application code and the infrastructure code. This ensures that all changes are tracked and can be audited.

There are two separate pipelines:

1. **Infrastructure Pipeline**: This pipeline is triggered whenever changes are pushed to the infrastructure code in GitHub. It uses Terraform to apply the changes to the AWS environment.

2. **Application Pipeline**: This pipeline is triggered whenever changes are pushed to the application code in GitHub. It builds a Docker image of the application, pushes it to a Docker registry, and then deploys the application to the EKS cluster.

## Demo

To deploy the infrastructure, you need to have Terraform installed and AWS credentials configured. Then, you can clone this repository and run the following commands:

```bash
# Initialize Terraform
terraform init

# Plan the deployment
terraform plan

# Apply the deployment
terraform apply
