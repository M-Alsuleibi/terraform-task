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

  validation {
    condition     = can(regex("^(t2|t3|t3a|t4g|m5|m6i|m6g|c5|c6i|c6g)\\.", var.instance_type))
    error_message = "Instance type must be a supported type (t2, t3, t3a, t4g, m5, m6i, m6g, c5, c6i, c6g)."
  }
}
variable "arch" {
  description = "AMI architecture — x86_64 or arm64"
  type        = string
  default     = "x86_64"

  validation {
    condition     = contains(["x86_64", "arm64"], var.arch)
    error_message = "arch must be either 'x86_64' or 'arm64'."
  }
}

variable "tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
  default     = {}
}