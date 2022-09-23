#!/bin/bash

#Nom            : Installation Server Web
#Description    : Installation de hhtpd sur l'instance
#Ex)            : 
#Version        : 1.0
#Auteur         : ESGI

#############################
##### Information  ##########
#############################

## Hostname Configuration
hostnamectl set-hostname "${name_instance}"

## Installation Agent
cd /tmp
sudo yum install -y https://s3.amazonaws.com/ec2-downloads-windows/SSMAgent/latest/linux_amd64/amazon-ssm-agent.rpm
sudo systemctl enable amazon-ssm-agent
sudo systemctl start amazon-ssm-agent

## Installation ServerWeb
yum update -y
yum install -y httpd
systemctl start httpd
systemctl enable httpd
echo "Response coming from server Web ESGI" > /var/www/html/index.html