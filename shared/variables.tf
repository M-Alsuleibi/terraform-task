variable "deployment_bucket_name" {
  description = "Name of the S3 deployment bucket"
  type        = string
}

variable "tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
  default     = {}
}