# variables module

variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1" # changed from ap-southeast-2
}

variable "vpc_cidr" {
  description = "VPC CIDR block"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_cidr" {
  description = "Subnet CIDR block"
  type        = string
  default     = "10.0.1.0/24"
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "Instance type"
  type        = string
  default     = "t2.micro"
}

variable "ssh_ip" {
  description = "Your public IP address for SSH access"
  type        = string
}

variable "availability_zone" {
  description = "Availability zone"
  type        = string
  default     = "us-east-1a"
}

variable "instance_name" {
  description = "Name of the instance"
  type        = string
  default     = "ec2-instance-deployed-with-terraform"
}

variable "aws_access_key" {
  description = "AWS Access Key ID"
  type        = string
  sensitive   = true  # Marking it as sensitive to avoid logging it in the plan
}

variable "aws_secret_key" {
  description = "AWS Secret Access Key"
  type        = string
  sensitive   = true  # Marking it as sensitive to avoid logging it in the plan
}