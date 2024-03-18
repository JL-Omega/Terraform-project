# Define resource block for provisioning an Elastic IP (EIP)

resource "aws_eip" "lb" {
  instance = var.instance_id  # Specify the instance ID for the EIP association
  domain   = "vpc"            # Specify the domain for the EIP (vpc or standard)

  # Provisioner block for local-exec type to execute a command after resource creation
  provisioner "local-exec" {
    command = "echo ${self.public_ip} > ip_ec2.txt"  # Execute command to echo the public IP and redirect it to a file
  }
}

