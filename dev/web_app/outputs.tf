output "instance_public_ip" {
  description = "Public IP of the dev EC2 instance"
  value       = module.web_app.instance_public_ip
}

output "instance_id" {
  description = "Instance ID of the dev EC2 instance"
  value       = module.web_app.instance_id
}