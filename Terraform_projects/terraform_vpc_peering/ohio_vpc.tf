resource "aws_vpc" "ohio_vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"
  provider = aws.ohio

  tags = {
    Name = "ohio_vpc"
  }
}
resource "aws_subnet" "public_subnet_ohio_1" {
  vpc_id     = aws_vpc.ohio_vpc.id
  cidr_block = "10.0.1.0/24"
  provider = aws.ohio

  tags = {
    Name = "public_subnet_ohio"
  }
}
resource "aws_subnet" "public_subnet_ohio_2" {
  vpc_id     = aws_vpc.ohio_vpc.id
  cidr_block = "10.0.2.0/24"
  provider = aws.ohio

  tags = {
    Name = "public_subnet_ohio_2"
  }
}
resource "aws_subnet" "private_subnet_ohio_1" {
  vpc_id     = aws_vpc.ohio_vpc.id
  cidr_block = "10.0.3.0/24"
  provider = aws.ohio

  tags = {
    Name = "private_subnet_ohio_1"
  }
}
resource "aws_subnet" "private_subnet_ohio_2" {
  vpc_id     = aws_vpc.ohio_vpc.id
  cidr_block = "10.0.4.0/24"
  provider = aws.ohio

  tags = {
    Name = "private_subnet_ohio_2"
  }
}
resource "aws_eip" "ohio_ngateway" {
  provider = aws.ohio
  domain   = "vpc"
}
resource "aws_internet_gateway" "ohio_igw" {
  vpc_id = aws_vpc.ohio_vpc.id
  provider = aws.ohio

  tags = {
    Name = "ohio_igw"
  }
}
resource "aws_nat_gateway" "nat_o" {
  provider = aws.ohio
  allocation_id = aws_eip.ohio_ngateway.id
  subnet_id     = aws_subnet.public_subnet_ohio_1.id

  tags = {
    Name = "nat_o"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.ohio_igw]
}
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.ohio_vpc.id
  provider = aws.ohio

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ohio_igw.id
  }

  route {
    cidr_block                = "11.0.0.0/16" 
    vpc_peering_connection_id = aws_vpc_peering_connection.my-peering.id
  }

  tags = {
    Name = "public_route_table"
  }
}
resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.ohio_vpc.id
  provider = aws.ohio
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat_o.id
  }

  tags = {
    Name = "private_route_table"
  }
}
resource "aws_route_table_association" "public_ass_1" {
  provider = aws.ohio
  subnet_id      = aws_subnet.public_subnet_ohio_1.id
  route_table_id = aws_route_table.public_route_table.id
}
resource "aws_route_table_association" "public_ass_2" {
  provider = aws.ohio
  subnet_id      = aws_subnet.public_subnet_ohio_2.id
  route_table_id = aws_route_table.public_route_table.id
}
resource "aws_route_table_association" "private_ass_1" {
  provider = aws.ohio
  subnet_id      = aws_subnet.private_subnet_ohio_1.id
  route_table_id = aws_route_table.private_route_table.id
}
resource "aws_route_table_association" "private_ass_2" {
  provider = aws.ohio
  subnet_id      = aws_subnet.private_subnet_ohio_2.id
  route_table_id = aws_route_table.private_route_table.id
}