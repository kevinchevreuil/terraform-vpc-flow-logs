# VPC Flow logs deployment from Terraform

## The code

### Arborescence

src/terraform = source code  
src/terraform/classical-resources = data files and configurations files  
src/terraform/classical-resources/001-cloudwatch-logs.tf = Creation of the CloudWatch ressource  
src/terraform/classical-resources/002-vpc.tf = Creation of the VPC  
src/terraform/classical-resources/003-vpc-flow-logs.tf = Creation of the VPC flow logs ressource  
src/terraform/classical-resources/004-ec2.tf = Creation of the EC2 instance  
src/terraform/regions/stating = preprod  
src/terraform/regions/prod = prod (do not use)  
