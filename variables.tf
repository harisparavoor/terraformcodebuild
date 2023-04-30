variable "region" {
  type = string
  default = "ap-south-1"
}

variable "vpc_cidr" {
  type = string
  default = "10.1.0.0/16"
}

variable "public_subnet" {
  type = string
  default = "10.1.1.0/24"
}

variable "private_subnet" {
  type = string
  default = "10.1.2.0/24"
}

variable "windows_ami" {
  type = string
  default = "ami-04893cdb768d0f9ee"
}

variable "amazon_linux_ami" {
  type = string
  default = "ami-0f8ca728008ff5af4"
}

variable "instance_type" {
  type = string
  default = "t2.micro"
}
variable "public_key" {
  type = string
  default = "hari_owndev"
}
variable "instance_iam_profile" {
  type    = string
  default = "EC2RoleForSSM"
}
variable "public_ip"{
  type    = string
  default = "hari.eip"
}