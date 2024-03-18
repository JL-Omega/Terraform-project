# Define variables for AWS provider configuration

# AWS region variable with a default value
variable "provider_region" {
  type    = string
  default = "us-east-1"
}

# AWS credentials file variable as a list of strings with a default value
variable "provider_credentials" {
  type    = list(string)
  default = ["C:/Users/jlmpa/Desktop/EAZY_TRAINING/Bootcamp/AWS-Keys/cheche/cheche_access/credentials"]
}
