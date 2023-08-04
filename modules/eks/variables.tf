variable "cluster_name" {
  description = "The name of the EKS cluster"
  type        = string
}

variable "cluster_version" {
  description = "The Kubernetes version to use for the EKS cluster"
  type        = string
  default     = "1.20"
}

variable "subnets" {
  description = "A list of subnet IDs to launch the EKS cluster in"
  type        = list(string)
}

variable "vpc_id" {
  description = "The ID of the VPC where the EKS cluster will be launched"
  type        = string
}

variable "desired_capacity" {
  description = "The desired number of worker nodes"
  type        = number
  default     = 1
}

variable "max_capacity" {
  description = "The maximum number of worker nodes"
  type        = number
  default     = 3
}

variable "min_capacity" {
  description = "The minimum number of worker nodes"
  type        = number
  default     = 1
}

variable "instance_type" {
  description = "The instance type to use for worker nodes"
  type        = string
  default     = "t3.medium"
}

variable "key_name" {
  description = "The key name to use for worker nodes"
  type        = string
}
