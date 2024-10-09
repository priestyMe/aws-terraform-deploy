# Output the IDs of instances in the Auto-Scaling Group
output "instance_ids" {
  value = [for instance in aws_autoscaling_group.ec2_asg.instances : instance.id]
}

# Data source to retrieve instances launched by the Auto-Scaling Group based on their tags
data "aws_autoscaling_group" "asg" {
  name = aws_autoscaling_group.ec2_asg.name
}

data "aws_instance" "asg_instances" {
  count = length(data.aws_autoscaling_group.asg.instances)

  filter {
    name   = "tag:Name"
    values = [var.instance_name]
  }
}

# Output the public IPs of the instances managed by the Auto-Scaling Group
output "instance_public_ips" {
  value = [for instance in data.aws_instance.asg_instances : instance.public_ip]
}