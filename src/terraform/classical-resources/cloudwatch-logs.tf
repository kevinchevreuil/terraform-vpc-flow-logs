resource "aws_cloudwatch_log_group" "flowlogs5src1grp2" {
  name = "5src1grp2" 
}

data "aws_iam_role" "VPCFlowLog_Role_ssm" {
  name = "esgi_VPCFlowLog_Role"
}