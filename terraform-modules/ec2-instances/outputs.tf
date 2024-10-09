# Data source to filter instances by the Auto Scaling Group tag
data "aws_instances" "asg_instances" {
  filter {
    name   = "tag:aws:autoscaling:groupName"
    values = [aws_autoscaling_group.ec2_asg.name]
  }
}

# Output the instance IDs of the instances in the Auto Scaling Group
output "instance_ids" {
  value = data.aws_instances.asg_instances.*.id
}