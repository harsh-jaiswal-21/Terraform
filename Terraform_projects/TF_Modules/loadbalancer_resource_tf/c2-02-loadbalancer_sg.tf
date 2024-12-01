# resource "aws_security_group" "loadbalancer_sg" {
#   name        = "loadbalancer_sg"
#   description = "Allow TLS inbound traffic and all outbound traffic"
#   vpc_id      = aws_vpc.main.id

#   tags = {
#     Name = "loadbalancer_sg"
#   }
# }

# resource "aws_vpc_security_group_ingress_rule" "loadbalancer_sg_http" {
#   security_group_id = aws_security_group.loadbalancer_sg.id
#   cidr_ipv4         = "0.0.0.0/0"
#   from_port         = 80
#   ip_protocol       = "tcp"
#   to_port           = 80
# }

# resource "aws_vpc_security_group_ingress_rule" "loadbalancer_sg_ssh" {
#   security_group_id = aws_security_group.loadbalancer_sg.id
#   cidr_ipv4         = "0.0.0.0/0"
#   from_port         = 22
#   ip_protocol       = "tcp"
#   to_port           = 22
# }


# resource "aws_vpc_security_group_egress_rule" "allow_all_traffic" {
#   security_group_id = aws_security_group.loadbalancer_sg.id
#   cidr_ipv4         = "0.0.0.0/0"
#   ip_protocol       = "-1" # semantically equivalent to all ports
# }

resource "aws_security_group" "loadbalancer_sg" {
  name        = "load-balancer-sg"
  description = "Security group for Load Balancer"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

