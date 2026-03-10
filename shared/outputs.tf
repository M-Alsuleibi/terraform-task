output "deployment_bucket_name" {
  description = "Name of the S3 deployment bucket"
  value       = aws_s3_bucket.deployment.bucket
}

output "deployment_bucket_arn" {
  description = "ARN of the S3 deployment bucket"
  value       = aws_s3_bucket.deployment.arn
}

output "iam_policy_arn" {
  description = "ARN of the IAM policy granting read access to the deployment bucket"
  value       = aws_iam_policy.s3_deployment_read.arn
}

output "key_pair_name" {
  description = "Name of the AWS key pair for EC2 SSH access"
  value       = aws_key_pair.deployer.key_name
}

output "private_key_pem" {
  description = "Private key PEM - save this locally to SSH into instances"
  value       = tls_private_key.ssh_key.private_key_pem
  sensitive   = true
}