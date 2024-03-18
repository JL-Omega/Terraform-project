# Define outputs for the Elastic IP (EIP) ID and associated instance's public IP address

output "eip_id" {
  value = aws_eip.lb.id  # Output the ID of the provisioned EIP
}

output "instance_public_ip" {
  value = aws_eip.lb.public_ip  # Output the public IP address associated with the EIP
}
