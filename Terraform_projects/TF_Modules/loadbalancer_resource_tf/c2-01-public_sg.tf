# resource "aws_security_group" "public_sg" {
#   name        = "public_sg"
#   description = "Allow TLS inbound traffic and all outbound traffic"
#   vpc_id      = aws_vpc.main.id

#   tags = {
#     Name = "public_sg"
#   }
# }

# resource "aws_vpc_security_group_ingress_rule" "public_sg_http" {
#   security_group_id = aws_security_group.public_sg.id
#   cidr_ipv4         = aws_security_group.loadbalancer_sg.cidr_block

#   from_port         = 80
#   ip_protocol       = "tcp"
#   to_port           = 80
# }

# resource "aws_vpc_security_group_ingress_rule" "public_sg_ssh" {
#   security_group_id = aws_security_group.public_sg.id
#   cidr_ipv4         = aws_security_group.loadbalancer_sg.cidr_block
#   from_port         = 22
#   ip_protocol       = "tcp"
#   to_port           = 22
# }


# resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
#   security_group_id = aws_security_group.public_sg.id
#   cidr_ipv4         = "0.0.0.0/0"
#   ip_protocol       = "-1" # semantically equivalent to all ports
# }




resource "aws_security_group" "public_sg" {
  name        = "public_sg"
  description = "Security group for Load Balancer"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port = 80
    to_port   = 80
    protocol  = "tcp"
    #  cidr_blocks = ["0.0.0.0/0"]
    security_groups = [aws_security_group.loadbalancer_sg.id] #Allow traffic from Load Balancer SG
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
