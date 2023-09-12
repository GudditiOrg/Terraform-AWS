output "aws_instance_publicip" {
    value = aws_instance.ec2Instance[*].public_dns
  
}
