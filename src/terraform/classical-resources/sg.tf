########################################
##### Security Groupe to Access to Web Server ###
########################################

resource "aws_security_group" "allow_http" {
    name        = "allow_http"
    description = "Security group for web-server with HTTP ports open within VPC"
    vpc_id      = aws_vpc.vpc.id
        egress {
            from_port   = 0
            to_port     = 0
            protocol    = "-1"
            cidr_blocks = ["0.0.0.0/0"]
        }
        ingress {
            # TLS (change to whatever ports you need)
            from_port   = 80
            to_port     = 80
            protocol    = "TCP"
            # Please restrict your ingress to only necessary IPs and ports.
            # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
            cidr_blocks = ["0.0.0.0/0"]# add a CIDR block here
        }
}