output "instance_public_ip" {
  description = "Public IP of the prod EC2 instance"
  value       = module.web_app.instance_public_ip
}

output "instance_id" {
  description = "Instance ID of the prod EC2 instance"
  value       = module.web_app.instance_id
}