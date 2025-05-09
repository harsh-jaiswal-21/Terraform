resource "aws_vpc" "project_vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = local.common_tags
}
resource "aws_subnet" "public_1" {
  vpc_id     = aws_vpc.project_vpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "public_1"
  }
}
resource "aws_subnet" "public_2" {
  vpc_id     = aws_vpc.project_vpc.id
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "public_2"
  }
}
resource "aws_subnet" "private_1" {
  vpc_id     = aws_vpc.project_vpc.id
  cidr_block = "10.0.3.0/24"

  tags = {
    Name = "private_1"
  }
}
resource "aws_subnet" "private_2" {
  vpc_id     = aws_vpc.project_vpc.id
  cidr_block = "10.0.4.0/24"

  tags = {
    Name = "private_2"
  }
}
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.project_vpc.id

  tags = {
    Name = "project-vpc-igw"
  }
}
resource "aws_eip" "lb" {
  domain   = "vpc"
}
resource "aws_nat_gateway" "natty" {
  allocation_id = aws_eip.lb.id
  subnet_id     = aws_subnet.public_1.id

  tags = {
    Name = "gw NAT"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.igw]
}
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.project_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = local.common_tags
}
resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.project_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.natty.id
  }

  tags = local.common_tags
}
resource "aws_route_table_association" "public_rt-1_associate" {
  subnet_id      = aws_subnet.public_1.id
  route_table_id = aws_route_table.public_rt.id
}
resource "aws_route_table_association" "public_rt-2_associate" {
  subnet_id      = aws_subnet.public_2.id
  route_table_id = aws_route_table.public_rt.id
}
resource "aws_route_table_association" "private_rt-1_associate" {
  subnet_id      = aws_subnet.private_1.id
  route_table_id = aws_route_table.private_rt.id
}
resource "aws_route_table_association" "private_rt-2_associate" {
  subnet_id      = aws_subnet.private_2.id
  route_table_id = aws_route_table.private_rt.id
}