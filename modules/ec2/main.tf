# Data source to fetch the latest Ubuntu AMI

data "aws_ami" "ubuntu" {
  most_recent = true  # Get the most recent AMI
  owners      = var.ami_owner  # Specify the owners of the AMI to filter

  filter {
    name   = "name"  # Filter by name
    values = var.ami_value  # Specify the name of the AMI
  }

  filter {
    name   = "virtualization-type"  # Filter by virtualization type
    values = ["hvm"]  # Specify HVM (Hardware Virtual Machine)
  }
}

# Resource block for provisioning an EC2 instance

resource "aws_instance" "web" {
  ami                  = data.aws_ami.ubuntu.id  # Use the fetched Ubuntu AMI ID
  instance_type        = var.instance_type  # Specify the instance type
  security_groups      = var.instance_sg  # Specify security groups
  key_name             = var.instance_key_name  # Specify the key pair name
  availability_zone    = var.instance_zone  # Specify the availability zone
  tags                 = var.instance_tag  # Specify tags for the instance

  # Connection block for SSH connection configuration
  connection {
    type        = "ssh"
    user        = "ubuntu"  # User for SSH connection, adjust as needed
    private_key = file("${var.instance_private_key}")  # Path to your private key file
    host        = self.public_ip  # Public IP address of the instance
  }

  # Provisioner block for remote-exec type to execute commands on the EC2 instance after creation
  provisioner "remote-exec" {
    inline = [ 
      "sudo apt update -y",     # Update package index
      "sudo apt install nginx -y"  # Install Nginx web server
     ]
  }
}
