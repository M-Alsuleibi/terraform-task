variable "environment" {
  description = "Deployment environment (dev or prod)"
  type        = string
}

variable "project_name" {
  description = "Project name prefix used for resource naming"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID where the security group will be created"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID where the EC2 instance will be launched"
  type        = string
}

variable "my_ip" {
  description = "Your public IP in CIDR notation for SSH access"
  type        = string
}

variable "s3_bucket" {
  description = "Name of the deployment S3 bucket"
  type        = string
}

variable "s3_script_key" {
  description = "S3 object key for the launch script (e.g. scripts/launch.sh)"
  type        = string
}

variable "policy_arn" {
  description = "IAM policy ARN granting S3 read access — attached to the EC2 instance role"
  type        = string
}

variable "key_name" {
  description = "AWS key pair name to attach to the EC2 instance for SSH access"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}