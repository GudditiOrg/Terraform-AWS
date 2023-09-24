output "publicip" {
  value = aws_instance.myinstance[*].public_ip
}
output "dns" {
  value = [ for instance in aws_instance.myinstance : instance.public_dns ]
  
}

