# Define variables for EC2 instance configuration

# Map variable for instance tags with a default value
variable "instance_tag" {
  type    = map(string)
  default = {
    "Name" = "Cheche"  # Default tag "Name" with value "Cheche"
  }
}

# String variable for instance type with a default value
variable "instance_type" {
  type    = string
  default = "t3.micro"  # Default instance type
}

# List variable for AMI owners with a default value
variable "ami_owner" {
  type    = list(string)
  default = [ "099720109477" ]  # Default Canonical owner
}

# Set variable for AMI values with a default value
variable "ami_value" {
  type    = set(string)
  default = [ "ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*" ]  # Default Ubuntu AMI value
}

# Set variable for instance security groups with a default value
variable "instance_sg" {
  type    = set(string)
  default = [ "" ]  # Default empty security group
}

# String variable for instance key pair with a default value
variable "instance_key_name" {
  type    = string
  default = "OpenSSH"  # Default key pair name
}

# File variable for instance private key with a default value
variable "instance_private_key" {
  type = string
  default = "C:/Users/jlmpa/Desktop/EAZY_TRAINING/AWS-Keys/OpenSSH.pem"
}

# String variable for instance availability zone with a default value
variable "instance_zone" {
  type    = string
  default = "us-east-1a"  # Default availability zone
}
