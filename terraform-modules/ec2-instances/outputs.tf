# Output the instance IDs of the instances in the Auto-Scaling Group
output "instance_ids" {
  value = aws_autoscaling_group.ec2_asg.instance_ids
}

# Data source to filter instances by tags
data "aws_instances" "asg_instances" {
  filter {
    name   = "tag:aws:autoscaling:groupName"
    values = [aws_autoscaling_group.ec2_asg.name]
  }
}

# Output the public IPs of the instances in the Auto-Scaling Group
output "instance_public_ips" {
  value = data.aws_instances.asg_instances.*.public_ip
}