resource "random_id" "bucket_suffix" {
  byte_length = 4
}

resource "tls_private_key" "ssh_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = tls_private_key.ssh_key.public_key_openssh

  tags = var.tags

}

resource "aws_s3_bucket" "deployment" {
  bucket        = var.deployment_bucket_name
  force_destroy = true

  tags = var.tags
}

resource "aws_iam_policy" "s3_deployment_read" {
  name        = "s3-deployment-read"
  description = "Grants read access to the deployment S3 bucket"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = "Allow S3DeploymentAcces"
        Effect = "Allow"
        Action = [
          "s3:GetObject",
          "s3:ListBucket"
        ]
        Resource = [
          "${aws_s3_bucket.deployment.arn}/*",
          aws_s3_bucket.deployment.arn
        ]
      },
    ]
  })

  tags = var.tags

}

resource "aws_s3_object" "launch_script" {
  bucket = aws_s3_bucket.deployment.id
  key    = "scripts/launch.sh"
  source = "${path.module}/launch.sh"
  etag   = filemd5("${path.module}/launch.sh")
}