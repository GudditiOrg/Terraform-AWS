#!/bin/bash
sudo apt update
sudo apt install nginx -y
sudo systemctl enable nginx
echo "<h1>Hello World from $(hostname -f)</h1>" > /usr/share/nginx/html
sudo systemctl start nginx