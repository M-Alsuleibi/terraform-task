output "vpc_id" {
  description = "ID of the prod VPC"
  value       = module.vpc.vpc_id
}

output "public_subnets" {
  description = "List of public subnet IDs in the prod VPC"
  value       = module.vpc.public_subnets
}