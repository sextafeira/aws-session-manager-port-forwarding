resource "aws_instance" "ec2_session_manager_port_forwarding" {
  ami                         = data.aws_ssm_parameter.amazon_linux.value
  instance_type               = var.instance_type
  subnet_id                   = data.aws_ssm_parameter.private_subnet_1a.value
  associate_public_ip_address = false
  vpc_security_group_ids      = [aws_security_group.ec2_session_manager_port_forwarding.id]
  iam_instance_profile        = aws_iam_instance_profile.ec2_session_manager_port_forwarding.name

  # A AMI padrão do Amazon Linux 2023 já inclui o SSM Agent.
  user_data = <<-EOF
    #!/bin/bash
    systemctl enable --now amazon-ssm-agent
  EOF

  depends_on = [
    aws_iam_role_policy_attachment.ec2_session_manager_port_forwarding,
    aws_vpc_security_group_egress_rule.ec2_session_manager_port_forwarding_https,
  ]

  metadata_options {
    http_tokens = "required"
  }

  root_block_device {
    encrypted   = true
    volume_type = "gp3"
  }

  tags = {
    Name        = format("%s-ec2", var.project_name_session_manager)
    Environment = var.environment
    Terraform   = "True"
  }
}
