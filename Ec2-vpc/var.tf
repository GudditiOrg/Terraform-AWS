locals {
  vpc_cidr      = "10.0.0.0/16"
  psubnet1_cidr = "10.0.1.0/24"
  psubnet2_cidr = "10.0.2.0/24"
}

variable "os" {
  type        = string
  default     = "ami-03f65b8614a860c29"
  description = "ami value"

}
variable "instancecount" {
  type        = number
  default     = 1
  description = "no of ec2 instance required"

}


variable "instancetype" {
  type        = string
  default     = "t2.micro"
  description = "ec2 instance type "
}

variable "domain_name" {

  type = string
  default = "gudditi.ga"
  description = "route53 domain name "

  
}