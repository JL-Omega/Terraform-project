# Define variables for EBS volume configuration

# String variable for EBS volume availability zone with a default value
variable "ebs_zone" {
  type    = string
  default = "us-east-1a"  # Default availability zone
}

# Number variable for EBS volume size with a default value
variable "ebs_size" {
  type    = number
  default = 20  # Default size of the EBS volume in GB
}

# Map variable for EBS volume tags with a default value
variable "ebs_tag" {
  type    = map(string)
  default = {
    "Name" = "Cheche_ebs"  # Default tag "Name" with value "Cheche_ebs"
  }
}
