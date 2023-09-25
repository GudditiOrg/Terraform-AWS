resource "aws_instance" "nginx" {
  ami = var.os
  //count = var.instancecount
  instance_type               = var.instancetype
  tenancy                     = "default"
  availability_zone           = "us-west-2a"
  key_name                    = aws_key_pair.deployer.key_name
  associate_public_ip_address = true
  subnet_id                   = aws_subnet.subnet1.id
  vpc_security_group_ids = [
    "${aws_security_group.nginx.id}"
  ]
  user_data = <<EOF
        sudo apt update
        sudo apt install nginx -y
        sudo systemctl enable nginx
        echo "<h1>Hello World from $(hostname -f)</h1>" > /usr/share/nginx/html
        sudo systemctl start nginx

    EOF

  # connection {
  #   type        = "ssh"
  #   user        = "ubuntu"
  #   private_key = tls_private_key.rsa.private_key_pem
  #   host        = aws_instance.nginx.public_ip
  # }

  # provisioner "remote-exec" {
  #   script = "nginx.sh"
  # }


}




resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = tls_private_key.rsa.public_key_openssh

}

# RSA key of size 4096 bits
resource "tls_private_key" "rsa" {
  algorithm = "RSA"
  rsa_bits  = 4096
}


