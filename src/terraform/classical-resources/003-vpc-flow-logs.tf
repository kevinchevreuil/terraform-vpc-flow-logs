#Create a VPC flow logs ressource#
resource "aws_flow_log" "flowlogs5src1grp2" {
  iam_role_arn    = data.aws_iam_role.flowlogs.arn
  log_destination = aws_cloudwatch_log_group.flowlogs5src1grp2.arn
  traffic_type    = "ALL"
  vpc_id          = aws_vpc.vpc.id
  tags            = merge(local.aws_tags, { Name = "grp2-logs${var.env}" })
}