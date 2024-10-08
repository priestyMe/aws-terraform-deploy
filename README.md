AWS EC2 Deployment with Terraform

This repository contains Terraform code for deploying and managing EC2 instances in AWS. It utilizes GitHub Actions to automate the deployment pipeline, ensuring infrastructure is consistently deployed across different environments such as development and production.

Project Overview

The project is designed to provision and manage infrastructure using Terraform modules. It includes separate configurations for development and production environments, enabling seamless, scalable, and maintainable deployments.

Features

	•	Automated deployment using GitHub Actions.
	•	Environment-specific configurations (Development and Production).
	•	Reusable Terraform modules.
	•	Secure SSH access via public IP address.
	•	Instance type and AMI configurations as secrets.
	•	Auto-scaling and monitoring (future enhancements).

Prerequisites

	•	Terraform CLI: Make sure you have Terraform installed. Download Terraform
	•	AWS Account: An active AWS account with an IAM user who has sufficient permissions.
	•	GitHub Secrets: Ensure the following secrets are configured in your GitHub repository:
	•	AWS_ACCESS_KEY_ID
	•	AWS_SECRET_ACCESS_KEY
	•	INSTANCE_TYPE
	•	AMI_ID
	•	AWS_REGION
	•	SSH_IP

GitHub Actions Workflow

The GitHub Actions workflow automates the following:

	•	Terraform Init: Initializes Terraform.
	•	Terraform Plan: Plans the infrastructure changes.
	•	Terraform Apply: Applies the changes to AWS when changes are merged to the main branch via pull requests.

Deployment Steps

	1.	Clone the repository:
        git clone https://github.com/yourusername/aws-terraform-deploy.git
        cd aws-terraform-deploy
    2.	Create a feature branch for adding or modifying modules:
        git checkout -b feature/module-name
    3.	Define your infrastructure in the relevant Terraform files in terraform-modules.
	4.	Push changes and open a pull request to the main branch.
	5.	GitHub Actions will automatically run the Terraform plan and apply based on the branch configuration.

Managing Environments

To manage multiple environments (e.g., dev, prod), separate variable files can be used:

	•	terraform.dev.tfvars: Variables for development.
	•	terraform.prod.tfvars: Variables for production.

When running Terraform commands locally, specify the appropriate variable file:
    terraform apply -var-file="terraform.dev.tfvars"

Future Enhancements -- working on this project to:

	•	Implement auto-scaling groups for production.
	•	Add CloudWatch monitoring and alarms.
	•	Expand networking (VPCs, subnets, etc.) for higher security.