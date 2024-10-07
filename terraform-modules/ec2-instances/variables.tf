variable "region" {
  description = "AWS region"
  type        = string
  default     = "ap-southeast-2"
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
  default     = "apse2-az1"
}

variable "instance_name" {
  description = "Name of the instance"
  type        = string
  default     = "ec2-instance-deployed-with-terraform"
}