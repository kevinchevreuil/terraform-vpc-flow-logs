#Create a VPC ressource#
resource "aws_vpc" "vpc" {
  cidr_block       = "10.2.0.0/16"
  instance_tenancy = "default"
  tags             = merge(local.aws_tags, { Name = "vpc-esgi-grp2-${var.env}" }) 
}

#Create an internet gateway ressource#
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.vpc.id
  tags   = merge(local.aws_tags, { Name = "gateway-esgi-grp2-${var.env}" })
}

#Create a route table ressource#
resource "aws_route_table" "publique_route" {
  vpc_id         = aws_vpc.vpc.id
    route {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_internet_gateway.gw.id
    }
      tags       = merge(local.aws_tags, { Name = "route-table-esgi-grp2-${var.env}" })
}

#Create a route table association ressource#
resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.subnet.id
  route_table_id = aws_route_table.publique_route.id
}

#Create a VPC subnet ressource#
resource "aws_subnet" "subnet" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "10.2.1.0/24"
  availability_zone = "${var.region}a"
  tags              = merge(local.aws_tags, { Name = "subnet-esgi-grp2-${var.env}" })
}