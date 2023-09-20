output "vpcid" {
    value = aws_vpc.my-vpc.id
  
}
output "publicip" {
    value = aws_instance.nginx.public_ip
  
}

output "private_key" {

    value = tls_private_key.rsa.private_key_pem
    sensitive = true
  
}

resource "local_file" "private_key" {
    content = tls_private_key.rsa.private_key_pem
    filename = "deployer-key.pem"
  
}

resource "local_file" "pub_key" {
    content = tls_private_key.rsa.public_key_pem
    filename = "deployer-key.pub"
  
}