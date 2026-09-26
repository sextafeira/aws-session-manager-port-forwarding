region                       = "us-east-1"
environment                  = "sandbox"
project_name_session_manager = "sessionmanager-port-forwarding"
instance_type                = "t4g.small"

ssm_policy_arn    = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
local_port_number = 8080
