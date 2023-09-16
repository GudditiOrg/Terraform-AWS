resource "aws_vpc" "my-vpc" {
  cidr_block           = local.vpc_cidr
  instance_tenancy     = "default"
  enable_dns_hostnames = "true"
  enable_dns_support   = "true"

}

resource "aws_subnet" "subnet1" {
  vpc_id                  = aws_vpc.my-vpc.id
  cidr_block              = local.psubnet1_cidr
  availability_zone       = "us-west-2a"
  map_public_ip_on_launch = "true"
}
resource "aws_subnet" "subnet2" {
  vpc_id                  = aws_vpc.my-vpc.id
  cidr_block              = local.psubnet2_cidr
  availability_zone       = "us-west-2b"
  map_public_ip_on_launch = "true"
}


resource "aws_internet_gateway" "myigw" {
  vpc_id = aws_vpc.my-vpc.id

}

# resource "aws_internet_gateway_attachment" "igwassociation" {
#   vpc_id              = aws_vpc.my-vpc.id
#   internet_gateway_id = aws_internet_gateway.myigw.id

# }

resource "aws_route_table" "MyPublicRoutetable" {
  vpc_id = aws_vpc.my-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.myigw.id
  }

}


resource "aws_route_table_association" "association1" {
  subnet_id      = aws_subnet.subnet1.id
  route_table_id = aws_route_table.MyPublicRoutetable.id
}

resource "aws_route_table_association" "association" {
  subnet_id      = aws_subnet.subnet2.id
  route_table_id = aws_route_table.MyPublicRoutetable.id
}

resource "aws_security_group" "mysg" {
  vpc_id = aws_vpc.my-vpc.id
  name   = "allow all ssh and http"

  ingress {
    description = "ssh"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "http"
    from_port   = 80
    to_port     = 80
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