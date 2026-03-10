resource "aws_security_group" "web" {
  name        = "${var.project_name}-${local.environment}-web-sg"
  description = "Allow HTTP from anywhere and SSH from deployer IP"
  vpc_id      = var.vpc_id

  ingress {
    description = "HTTP from anywhere"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "SSH from deployer IP only"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.my_ip]
  }

  egress {
    description = "Allow all outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = var.tags
}

resource "aws_iam_role" "ec2" {
  name = "${var.project_name}-${local.environment}-web-sg"

  # Trust policy 
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect    = "Allow"
        Principal = { Service = "ec2.amazonaws.com" }
        Action    = "sts:AssumeRole"
      }
    ]
  })

  tags = var.tags

}

# Permission policy(S3 read)
resource "aws_iam_role_policy_attachment" "s3_read" {
  role       = aws_iam_role.ec2.name
  policy_arn = var.policy_arn
}

# Instance profile 
resource "aws_iam_instance_profile" "ec2" {
  name = "${var.project_name}-${local.environment}-web-sg"
  role = aws_iam_role.ec2.name
}

resource "aws_instance" "web" {
  ami                    = data.aws_ami.amazon_linux.id
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.web.id]
  iam_instance_profile   = aws_iam_instance_profile.ec2.name

  # Enforce IMDSv2 
  metadata_options {
    http_tokens                 = "required"
    http_endpoint               = "enabled"
    http_put_response_hop_limit = 1
  }

  # Stub script — downloads and executes launch.sh from S3
  user_data = templatefile("${path.module}/userdata.sh", {
    bucket_name = var.s3_bucket
    script_key  = var.s3_script_key
  })

  tags = var.tags

}