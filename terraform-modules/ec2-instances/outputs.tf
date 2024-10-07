output "instance_id" {
  description = "The ID of the EC2 instance"
  value       = aws_instance.ec2-instance.id
}

output "instance_public_ip" {
  description = "The public IP address of the EC2 instance"
  value       = aws_instance.ec2-instance.public_ip
}