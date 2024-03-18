# Terraform AWS Infrastructure Provisioning

This Terraform project facilitates the automated provisioning of AWS resources, specifically targeting the deployment and management of EC2 instances, Elastic Block Store (EBS) volumes, Elastic IP addresses (EIPs), and associated security groups. The infrastructure setup is modularized for enhanced modularity, reusability, and maintainability.

---

## Table of Contents

- [Overview](#overview)
- [Components](#components)
- [Usage](#usage)
- [Prerequisites](#prerequisites)
- [Configuration](#configuration)
- [Execution](#execution)
- [Cleanup](#cleanup)
- [Notes](#notes)
- [Disclaimer](#disclaimer)
- [Author](#author)
- [Contact](#contact)

---

## Overview

This Terraform project streamlines the setup of AWS infrastructure components commonly used in cloud-based applications. It abstracts complex resource configurations into modular components, enabling streamlined provisioning and management.

---

## Components

1. **EC2 Module (`modules/ec2`)**:
   - Orchestrates the provisioning of EC2 instances with customizable configurations.
   - Utilizes the latest Ubuntu AMI for instance deployment.
   - Executes post-provisioning tasks via remote-exec provisioner, such as package updates and software installations.

2. **EBS Module (`modules/ebs`)**:
   - Manages the creation of Elastic Block Store (EBS) volumes tailored for EC2 instances.
   - Offers flexibility in specifying volume size, availability zone, and tagging.

3. **EIP Module (`modules/eip`)**:
   - Handles the provisioning of Elastic IP addresses (EIPs) and associates them with EC2 instances.
   - Facilitates retrieval of associated instance public IP addresses for further configurations.

4. **Security Group Module (`modules/sg`)**:
   - Configures security groups to regulate inbound and outbound traffic for EC2 instances.
   - Allows fine-grained rule customization for SSH, HTTP, and HTTPS traffic.

---

## Usage

Follow the outlined steps to utilize this Terraform project effectively:

-

### Prerequisites

Before proceeding, ensure the following prerequisites are met:

1. **Terraform Installation**:
   - Install Terraform locally on your system. You can download it from the [official Terraform website](https://developer.hashicorp.com/terraform/install).

2. **AWS Account**:
   - You must have access to an AWS account with appropriate permissions to provision resources.

-

### Configuration

1. **Update Variables**:
   - Customize variables in `terraform/app/variables.tf` and related variable files to match your AWS setup.
   - Update the [`provider_credentials`](https://github.com/JL-Omega/Terraform-project/blob/main/app/variables.tf) variable to point to your AWS credentials file.
   - Modify the [`instance_private_key`](https://github.com/JL-Omega/Terraform-project/blob/main/modules/ec2/variables.tf) variable to specify the path to your private key file for SSH access.

2. **Customize Configurations**:
   - Tailor EC2 instance, EBS volume, EIP, and security group configurations to your specific requirements within respective directories.

-

### Execution

1. **Initialization**:
   - Initialize Terraform within the `app` directory using the command: `terraform init`.

2. **Plan Review**:
   - Review the execution plan to verify proposed changes: `terraform plan`.

3. **Apply Changes**:
   - Apply the changes to provision resources: `terraform apply`.

---

## Cleanup

Upon completion, follow these steps to clean up resources:

1. **Destroy Resources**:
   - Execute `terraform destroy` to tear down provisioned resources.

---

## Notes

- **Modularity**: The project adopts a modular approach, encapsulating resource configurations within distinct modules for enhanced organization and manageability.
- **Flexibility**: Leverage variables to customize AWS region, credentials, instance types, AMI settings, volume sizes, and more, ensuring flexibility in deployment.
- **Post-Provisioning Tasks**: Utilize provisioners to execute commands on EC2 instances post-provisioning, enabling additional setup tasks.
- **Output Information**: Outputs provide crucial information such as instance IDs, EBS volume IDs, EIP IDs, and security group names for further integration or reference.

---

## Disclaimer

- **Cost Considerations**: Exercise caution to avoid unnecessary expenses associated with AWS resources. Review configurations diligently to optimize cost efficiency.
- **Security Best Practices**: Adhere to security best practices, particularly regarding security group configurations, to maintain a secure infrastructure environment.
- **Documentation and Support**: Refer to Terraform documentation and AWS resources for comprehensive guidance and support on infrastructure setup and management.

---

## Author

- [Jean-Luc Mpande](https://www.linkedin.com/in/jean-luc-mpande-75981a23b/)

---

## Contact

For inquiries, feedback, or assistance, please reach out to [LinkedIn](https://www.linkedin.com/in/jean-luc-mpande-75981a23b/). Contributions and suggestions are highly appreciated!

---
