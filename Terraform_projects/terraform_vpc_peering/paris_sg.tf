resource "aws_security_group" "paris_sg" {
  name        = "paris_sg"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.paris_vpc.id
  provider = aws.paris
  

  tags = {
    Name = "paris_sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "ssh_prs" {
  provider = aws.paris
  security_group_id = aws_security_group.paris_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}
resource "aws_vpc_security_group_ingress_rule" "http_prs" {
  provider = aws.paris
  security_group_id = aws_security_group.paris_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4_prs" {
  provider = aws.paris
  security_group_id = aws_security_group.paris_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}
