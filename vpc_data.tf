data "aws_ssm_parameter" "vpc" {
  name = "/vpc_id"
}

data "aws_ssm_parameter" "private_subnet_1a" {
  name = "/private_subnet_1a_id"
}

data "aws_ssm_parameter" "public_subnet_1a" {
  name = "/private_subnet_1a_id"
}
