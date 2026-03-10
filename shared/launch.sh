#!/bin/bash
set -euxo pipefail

dnf update -y
dnf install -y httpd

TOKEN=$(curl -s -X PUT "http://169.254.169.254/latest/api/token" \
  -H "X-aws-ec2-metadata-token-ttl-seconds: 60")

INSTANCE_ID=$(curl -s -H "X-aws-ec2-metadata-token: $TOKEN" \
  http://169.254.169.254/latest/meta-data/instance-id)

PRIVATE_IP=$(curl -s -H "X-aws-ec2-metadata-token: $TOKEN" \
  http://169.254.169.254/latest/meta-data/local-ipv4)

PUBLIC_IP=$(curl -s -H "X-aws-ec2-metadata-token: $TOKEN" \
  http://169.254.169.254/latest/meta-data/public-ipv4)

MAC=$(curl -s -H "X-aws-ec2-metadata-token: $TOKEN" \
  http://169.254.169.254/latest/meta-data/mac)

VPC_ID=$(curl -s -H "X-aws-ec2-metadata-token: $TOKEN" \
  "http://169.254.169.254/latest/meta-data/network/interfaces/macs/$MAC/vpc-id")

SUBNET_ID=$(curl -s -H "X-aws-ec2-metadata-token: $TOKEN" \
  "http://169.254.169.254/latest/meta-data/network/interfaces/macs/$MAC/subnet-id")

cat > /var/www/html/index.html <<EOF
<!DOCTYPE html>
<html>
<head>
<title>Terraform Project</title>
</head>
<body>
<h1>EC2 Metadata Page</h1>
<p><strong>Instance ID:</strong> ${INSTANCE_ID}</p>
<p><strong>Private IP Address:</strong> ${PRIVATE_IP}</p>
<p><strong>Public IP Address:</strong> ${PUBLIC_IP}</p>
<p><strong>VPC ID:</strong> ${VPC_ID}</p>
<p><strong>Subnet ID:</strong> ${SUBNET_ID}</p>
</body>
</html>
EOF

systemctl enable httpd
systemctl start httpd