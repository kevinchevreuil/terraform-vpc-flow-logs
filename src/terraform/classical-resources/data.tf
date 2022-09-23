##############################################################
# Data sources to get VPC, subnets and domaine details
##############################################################

data "aws_caller_identity" "current" {}


data "aws_ami" "web_server" {
  most_recent = true
  owners      = ["137112412989"]
  filter {
    name = "name"
    values = ["amzn2-ami-hvm-2.0.*-x86_64-gp2*"]
  }
}

data "aws_iam_role" "ec2_role_ssm" {
  name = "esgi_EC2_Role"
}

data "aws_iam_role" "flowlogs" {
  name = "esgi_VPCFlowLog_Role"
}