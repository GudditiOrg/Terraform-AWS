resource "tls_private_key" "rsa" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "ec2-key-pair" {
  key_name = "ec2-instace"
  public_key = tls_private_key.rsa.public_key_openssh
  
}

resource "local_file" "private_key"{
  content = tls_private_key.rsa.private_key_pem
  filename = "private-key"
  provisioner "local-exec" {
    command = "chmod private-key"
    
  }
}