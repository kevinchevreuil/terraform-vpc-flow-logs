############################
#####   Account conf   #####
############################
region             = "us-east-1"
env                = "prod"
tags_override      = {
  "bank:runningtimeframe" = "ALWAYS"
}

hostname_ec2       = "web-server-prod"