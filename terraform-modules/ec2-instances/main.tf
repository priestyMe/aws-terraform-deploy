provider "aws" {
  region     = var.region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
}

# Security Group for SSH access
resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow SSH access"
  vpc_id     = aws_vpc.main.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${var.ssh_ip}/32"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subnet_cidr
  availability_zone = var.availability_zone
}

# Specify AWS Launch Template
resource "aws_launch_template" "ec2_launch_template" {
  name_prefix   = "ec2-launch-template"
  image_id      = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name  # key_name variable for ssh access

  network_interfaces {
    associate_public_ip_address = true
    security_groups             = [aws_security_group.allow_ssh.id]
  }

  tags = {
    Name = var.instance_name
  }
}

# Create Auto-Scaling Group
resource "aws_autoscaling_group" "ec2_asg" {
  launch_template {
    id      = aws_launch_template.ec2_launch_template.id
    version = "$Latest"
  }

  min_size           = 1
  max_size           = 3
  desired_capacity   = 1
  vpc_zone_identifier = [aws_subnet.main.id]

  tag {
    key                 = "Name"
    value               = var.instance_name
    propagate_at_launch = true
  }

  health_check_type         = "EC2"
  health_check_grace_period = 300
}

resource "aws_autoscaling_policy" "scale_up" {
  name                    = "scale_up"
  autoscaling_group_name  = aws_autoscaling_group.ec2_asg.name
  scaling_adjustment      = 1
  adjustment_type         = "ChangeInCapacity"
  cooldown                = 300
}

resource "aws_autoscaling_policy" "scale_down" {
  name                    = "scale_down"
  autoscaling_group_name  = aws_autoscaling_group.ec2_asg.name
  scaling_adjustment      = -1
  adjustment_type         = "ChangeInCapacity"
  cooldown                = 300
}