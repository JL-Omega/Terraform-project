# Terraform configuration for provisioning AWS resources
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# AWS provider configuration
provider "aws" {
  region                  = var.provider_region  # Set the region dynamically
  shared_credentials_files = var.provider_credentials  # Use specified credentials file
}

# EC2 module instantiation
module "ec2" {
  source      = "../modules/ec2"  # Path to the EC2 module
  instance_sg = ["${module.sg.security_group_name}"]  # Pass security group name to the EC2 module
}

# EBS module instantiation
module "ebs" {
  source = "../modules/ebs"  # Path to the EBS module
}

# EIP module instantiation
module "eip" {
  source      = "../modules/eip"  # Path to the EIP module
  instance_id = module.ec2.instance_id  # Pass instance ID to the EIP module
}

# Security Group module instantiation
module "sg" {
  source = "../modules/sg"  # Path to the SG module
}

# Associate EIP with EC2 instance
resource "aws_eip_association" "eip_assoc" {
  instance_id   = module.ec2.instance_id  # Instance ID to associate with the EIP
  allocation_id = module.eip.eip_id  # Allocation ID of the EIP
}

# Attach EBS volume to EC2 instance
resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sdh"  # Device name to attach the volume to
  instance_id = module.ec2.instance_id  # Instance ID to attach the volume to
  volume_id   = module.ebs.ebs_id  # EBS volume ID
}
