resource "aws_iam_role" "ec2_session_manager_port_forwarding" {
  name = format("%s-port-forwarding", var.project_name_session_manager)

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
      Action = "sts:AssumeRole"
    }]
  })

  tags = {
    Name        = format("%s-role", var.project_name_session_manager)
    Environment = var.environment
    Terraform   = "True"
  }
}

resource "aws_iam_role_policy_attachment" "ec2_session_manager_port_forwarding" {
  role       = aws_iam_role.ec2_session_manager_port_forwarding.name
  policy_arn = var.ssm_policy_arn
}

resource "aws_iam_instance_profile" "ec2_session_manager_port_forwarding" {
  name = format("%s-port-forwarding", var.project_name_session_manager)
  role = aws_iam_role.ec2_session_manager_port_forwarding.name

  tags = {
    Name        = format("%s-instance-profile", var.project_name_session_manager)
    Environment = var.environment
    Terraform   = "True"
  }
}
