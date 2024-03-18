# Define resource block for provisioning an EBS volume

resource "aws_ebs_volume" "my_ebs" {
  availability_zone = var.ebs_zone  # Specify the availability zone for the EBS volume
  size              = var.ebs_size  # Specify the size of the EBS volume
  tags              = var.ebs_tag   # Specify tags for the EBS volume
}
