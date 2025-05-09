resource "aws_vpc" "paris_vpc" {
  cidr_block       = "11.0.0.0/16"
  instance_tenancy = "default"
  provider = aws.paris
  tags = {
    Name = "paris_vpc"
  }
}
resource "aws_subnet" "public_subnet_paris_1" {
  vpc_id     = aws_vpc.paris_vpc.id
  cidr_block = "11.0.1.0/24"
  provider = aws.paris

  tags = {
    Name = "public_subnet_paris"
  }
}
resource "aws_subnet" "public_subnet_paris_2" {
  vpc_id     = aws_vpc.paris_vpc.id
  cidr_block = "11.0.2.0/24"
  provider = aws.paris

  tags = {
    Name = "public_subnet_paris_2"
  }
}
resource "aws_subnet" "private_subnet_paris_1" {
  vpc_id     = aws_vpc.paris_vpc.id
  cidr_block = "11.0.3.0/24"
  provider = aws.paris

  tags = {
    Name = "private_subnet_paris_1"
  }
}
resource "aws_subnet" "private_subnet_paris_2" {
  vpc_id     = aws_vpc.paris_vpc.id
  cidr_block = "11.0.4.0/24"
  provider = aws.paris

  tags = {
    Name = "private_subnet_paris_2"
  }
}
resource "aws_eip" "paris_ngateway" {
  provider = aws.paris
  domain   = "vpc"
}
resource "aws_internet_gateway" "paris_igw" {
  vpc_id = aws_vpc.paris_vpc.id
  provider = aws.paris

  tags = {
    Name = "paris_igw"
  }
}
resource "aws_nat_gateway" "nat_p" {
  allocation_id = aws_eip.paris_ngateway.id
  subnet_id     = aws_subnet.public_subnet_paris_1.id
  provider = aws.paris

  tags = {
    Name = "nat_p"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.paris_igw]
}
resource "aws_route_table" "public_route_table_prs" {
  vpc_id = aws_vpc.paris_vpc.id
  provider = aws.paris

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.paris_igw.id
  }
  route {
    cidr_block                = "10.0.0.0/16" 
    vpc_peering_connection_id = aws_vpc_peering_connection.my-peering.id
  }

  tags = {
    Name = "public_route_table_prs"
  }
}
resource "aws_route_table" "private_route_table_prs" {
  vpc_id = aws_vpc.paris_vpc.id
  provider = aws.paris

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat_p.id
  }

  tags = {
    Name = "private_route_table_prs"
  }
}
resource "aws_route_table_association" "public_ass_1_prs" {
  provider = aws.paris
  subnet_id      = aws_subnet.public_subnet_paris_1.id
  route_table_id = aws_route_table.public_route_table_prs.id
}
resource "aws_route_table_association" "public_ass_2_prs" {
  provider = aws.paris
  subnet_id      = aws_subnet.public_subnet_paris_2.id
  route_table_id = aws_route_table.public_route_table_prs.id
}
resource "aws_route_table_association" "private_ass_1_prs" {
  provider = aws.paris
  subnet_id      = aws_subnet.private_subnet_paris_1.id
  route_table_id = aws_route_table.private_route_table_prs.id
}
resource "aws_route_table_association" "private_ass_2_prs" {
  provider = aws.paris
  subnet_id      = aws_subnet.private_subnet_paris_2.id
  route_table_id = aws_route_table.private_route_table_prs.id
}