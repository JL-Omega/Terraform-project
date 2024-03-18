# Define output for the instance ID of the provisioned EC2 instance

output "instance_id" {
  value = aws_instance.web.id  # Output the instance ID of the provisioned EC2 instance
}
