# aws_lb
resource "aws_lb" "nginx-lb" {
  name               = "nginx-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.LB.id]
  subnets            = [
    aws_subnet.subnet1.id,
    aws_subnet.subnet2.id,
    # Add more subnet IDs as needed
  ]

  enable_deletion_protection = false

  tags = {
    Environment = "test"
  }
}

# aws_lb_target_group
resource "aws_lb_target_group" "nginx-lb-tg" {
  name        = "nginx-lb-tg"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = aws_vpc.my-vpc.id
}

# aws_lb_target_group_attachment
resource "aws_lb_target_group_attachment" "nginx-target-group-attachment" {
  target_group_arn = aws_lb_target_group.nginx-lb-tg.arn
  target_id        = aws_lb.nginx-lb.arn
  
  port             = 80
}
resource "aws_lb_listener" "nginx" {
  load_balancer_arn = aws_lb.nginx-lb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      message_body = "Fixed response content"
      status_code  = "200"
    }
  }
}
