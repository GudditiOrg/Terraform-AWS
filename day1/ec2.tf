resource "aws_instance" "ec2Instance" {
    ami = var.os
    count = var.instancecount
    instance_type = var.instancetype
    tenancy = "host"
    availability_zone = "us-east-1a"
    user_data = <<EOF
        #!/bin/bash
        sudo su
        sudo apt update
        sudo apt install nginx -y
        systemctl enable nginx
        systemctl start nginx
    EOF


}
