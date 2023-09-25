# target Group

resource "aws_lb_target_group" "tg" {
  name     = "tf-example-lb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.my-vpc.id

  health_check {
    interval = 10
    path = "/"
    protocol = "HTTP"
    timeout = 5
    healthy_threshold = 5 
    unhealthy_threshold = 2  
  }
}


# Load Balancer

resource "aws_lb" "lb" {
  name               = "test-lb-tf"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.lbsg.id]
  subnets            = [aws_subnet.subnet1.id, aws_subnet.subnet2.id]

  enable_deletion_protection = true



  tags = {
    Environment = "test"
  }
}

# load Balancer listner

resource "aws_lb_listener" "listner" {
  load_balancer_arn = aws_lb.lb.arn
  port              = "80"
  protocol          = "HTTP"
  

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg.arn
  }
}

# target Group attachment

resource "aws_lb_target_group_attachment" "test" {
  target_group_arn = aws_lb_target_group.tg.arn
  target_id        = aws_instance.nginx.id
  port             = 80
}
