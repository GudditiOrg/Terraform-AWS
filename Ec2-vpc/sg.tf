resource "aws_security_group" "nginx" {
    vpc_id = aws_vpc.my-vpc.id
    name = "nginx"

    ingress {

        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
        description = "allow all"
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
        description = "allow all"
    }
  
}
