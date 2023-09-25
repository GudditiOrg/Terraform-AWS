# resource "null_resource" "connection" {
#   connection {
#     type     = "ssh"
#     user     = "ubuntu"
#     private_key = tls_private_key.rsa.private_key_pem
#     host     = aws_instance.nginx.public_ip
#   }
  
#   provisioner "remote-exec" {
#     inline = [
#       "sudo apt update",
#       "sudo apt remove nginx -y",
#       "sudo apt install apache2 -y ",
#       "sudo systemctl enable apache2",
#       "echo \"<h1>Hello World from $(hostname -f)</h1>\" > /var/www/html/index.html",
#       "sudo systemctl start apache2"
#     ]
#   }
  
# }