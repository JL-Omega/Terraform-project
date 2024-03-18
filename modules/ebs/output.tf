# Define output for the EBS volume ID of the provisioned EBS volume

output "ebs_id" {
  value = aws_ebs_volume.my_ebs.id  # Output the ID of the provisioned EBS volume
}
