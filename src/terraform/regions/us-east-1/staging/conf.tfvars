############################
#####   Account conf   #####
############################
region             = "us-east-1"
env                = "staging"
tags_override = {
  "bank:runningtimeframe" = "ALWAYS"
}

hostname_ec2 = "web-server-staging"