resource "aws_security_group" "nginx" {
  vpc_id = aws_vpc.my-vpc.id
  name   = "nginx"

  ingress {

    from_port   = 80
    to_port     = 80
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "allow all"
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "allow all"
  }

}

resource "aws_security_group" "LB" {
  vpc_id = aws_vpc.my-vpc.id
  name   = "LB"

  ingress {

    from_port   = 80
    to_port     = 80
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "allow all"
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "allow all"
  }

}


resource "aws_security_group_rule" "lb_to_nginxSG" {
    type = "ingress"
    from_port = 80
    to_port = 80
    source_security_group_id = aws_security_group.LB.id
    security_group_id = aws_security_group.nginx.id
  
}
