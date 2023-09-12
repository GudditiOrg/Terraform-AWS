variable "os" {
    type = string
    default = "ami-053b0d53c279acc90"
    description = "ami value"
  
}
variable "instancecount" {
    type = number
    default = 1
    description = "no of ec2 instance required"
  
}

variable "vpc_id" {
    type = string
    default = "vpc-0dc5a1b119e734312"
    description = "my default vpc_id"
  
}

variable "instancetype" {
    type = string
    default = "t2.micro"
    description = "ec2 instance type "
}