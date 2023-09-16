output "vpcid" {
    value = aws_vpc.my-vpc.id
  
}
# output "publicip" {
#     value = aws_instance.nginx[*].public_ip
  
# }

output "sgid" {
    value = aws_security_group.mysg.id
  
}