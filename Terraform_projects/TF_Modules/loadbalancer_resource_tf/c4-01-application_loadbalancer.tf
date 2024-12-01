resource "aws_lb" "test" {
  name               = "test-lb-tf"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.loadbalancer_sg.id]
  # subnets            = [for subnet in aws_subnet.public_subnet : subnet.id]
  subnets = [aws_subnet.public_subnet.id]

  enable_deletion_protection = false

  tags = {
    Environment = "production"
  }
}