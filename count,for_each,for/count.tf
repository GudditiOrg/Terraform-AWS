resource "aws_instance" "myinstance" {

  count = 2
  ami = "ami-03f65b8614a860c29"
  instance_type = "t2.micro"
  security_groups = [aws_security_group.mysg.name]
  key_name = "ec2-instace"
  tags = {
    Name = "MyInstace-${count.index}"
  }


  connection {
    type     = "ssh"
    user     = "ubuntu"
    private_key = tls_private_key.rsa.private_key_pem
    host     =  self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt update",
      "sudo apt install apache2 -y",
      "sudo systemctl start apache2"
    ]
   }
  
}



resource "aws_security_group" "mysg" {
  name = "mysg"

  ingress {
    from_port = 0
    to_port = 0
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "allow all"

  }
  
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
}

