variable "vpc_cidr" {}
variable "public_subnet" {}
variable "private_subnet" {}
variable "windows_ami" {}
variable "amazon_linux_ami" {}
variable "instance_type" {}
variable "public_key" {}
variable "instance_iam_profile"{}
variable "public_ip"{}
#variable "instance_web2_id"{
 #   type = string
#}
variable "vpc_id" {}
variable "private_subnet_id" {
    type = string
}

variable "public_subnet_id" {
    type = string
}
