resource "aws_vpc" "main" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "main"
  }
}
resource "aws_subnet" "public_subnet-1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "public_subnet-1a"
  }
}
resource "aws_subnet" "private_subnet-1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "private_subnet-1a"
  }
}
resource "aws_subnet" "public_subnet-2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.11.0/24"
  availability_zone = "us-east-1b"
  tags = {
    Name = "public_subnet-1b"
  }
}
resource "aws_subnet" "private_subnet-2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.22.0/24"
  availability_zone = "us-east-1b"
  tags = {
    Name = "private_subnet-1b"
  }
}
resource "aws_internet_gateway" "my-igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "internet-gateway"
  }
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my-igw.id
  }

  tags = {
    Name = "Public_Route_table"
  }
}
resource "aws_route_table_association" "public_asso_1" {
  subnet_id      =   aws_subnet.public_subnet-1.id
  route_table_id =   aws_route_table.public_rt.id
}
resource "aws_route_table_association" "public_asso_2" {
  subnet_id      =   aws_subnet.public_subnet-2.id
  route_table_id =   aws_route_table.public_rt.id
}
resource "aws_eip" "lb" {
  domain   = "vpc"
  tags = {
    Name = "for-nat"
  }
}
# resource "aws_eip" "lb2" {
#   domain   = "vpc"
#   tags = {
#     Name = "for-nat"
#   }
# }
resource "aws_nat_gateway" "my-nat-1" {
  allocation_id = aws_eip.lb.id
  subnet_id     = aws_subnet.public_subnet-1.id 

  tags = {
    Name = "gw NAT"
  }
  depends_on = [aws_internet_gateway.my-igw]
}
# resource "aws_nat_gateway" "my-nat-2" {
#   allocation_id = aws_eip.lb2.id
#   subnet_id     = aws_subnet.private_subnet-2.id

#   tags = {
#     Name = "gw NAT"
#   }
# }
resource "aws_route_table" "private-rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.my-nat-1.id
  }
  tags = {
    Name = "private-rt"
  }
}

resource "aws_route_table_association" "pvt_1" {
  subnet_id      = aws_subnet.private_subnet-1.id
  route_table_id = aws_route_table.private-rt.id
}
resource "aws_route_table_association" "pv1-2" {
  subnet_id      = aws_subnet.private_subnet-2.id
  route_table_id = aws_route_table.private-rt.id
}