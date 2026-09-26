output "ec2_session_manager_port_forwarding_instance_id" {
  value = aws_instance.ec2_session_manager_port_forwarding.id
}

output "ec2_session_manager_port_forwarding_private_ip" {
  value = aws_instance.ec2_session_manager_port_forwarding.private_ip
}

output "ec2_session_manager_port_forwarding_security_group_id" {
  value = aws_security_group.ec2_session_manager_port_forwarding.id
}

output "ec2_session_manager_command" {
  value = format("aws ssm start-session --region %s --target %s", var.region, aws_instance.ec2_session_manager_port_forwarding.id)
}

output "ec2_session_manager_port_forwarding_command" {
  value = format("aws ssm start-session --region %s --target %s --document-name AWS-StartPortForwardingSession --parameters 'localPortNumber=%s,portNumber=5678'", var.region, aws_instance.ec2_session_manager_port_forwarding.id, var.local_port_number)
}

output "ec2_session_manager_port_forwarding_url" {
  value = format("http://localhost:%s", var.local_port_number)
}
