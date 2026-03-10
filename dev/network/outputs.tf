output "vpc_id" {
  description = "ID of the dev VPC"
  value       = module.vpc.vpc_id
}

output "public_subnets" {
  description = "List of public subnet IDs in the dev VPC"
  value       = module.vpc.public_subnets
}