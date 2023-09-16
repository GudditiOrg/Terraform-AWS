# resource "aws_instance" "nginx" {
#     ami = var.os
#     count = var.instancecount
#     instance_type = var.instancetype
#     tenancy = "host"
#     availability_zone = "us-west-2a"
#     //security_groups = aws_security_group.mysg.id
#     user_data = <<EOF
        # #!/bin/bash
        # sudo su
        # sudo apt update
        # sudo apt install nginx -y
        # systemctl enable nginx
        # systemctl start nginx
#     EOF
  
# }