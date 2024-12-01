resource "aws_security_group" "sec_g" {
  name        = "sec_g"
  description = "Allow TLS inbound traffic and all outbound traffic"
  tags = {
    Name = "sec_g"
  }
}

resource "aws_vpc_security_group_ingress_rule" "sec_g_ssh" {
  security_group_id = aws_security_group.sec_g.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_ingress_rule" "sec_g_http" {
  security_group_id = aws_security_group.sec_g.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.sec_g.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}

