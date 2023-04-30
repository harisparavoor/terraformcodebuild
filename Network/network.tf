resource "aws_vpc" "TF-prod-vpc" {
  cidr_block       = var.vpc_cidr
  #enable_dns_support = “true” #gives you an internal domain name
  #enable_dns_hostnames = “true” #gives you an internal host name
  #enable_classiclink = “false”
  instance_tenancy = "default"

  tags = { 
    Name = "TF-prod-vpc"
  }
}
resource "aws_internet_gateway" "TF-prod-igw" {
  vpc_id = "${aws_vpc.TF-prod-vpc.id}"
  tags = {
     Name = "TF-prod-igw"
  }
}
resource "aws_route_table" "prod-public-route_table" {
    vpc_id = "${aws_vpc.TF-prod-vpc.id}"
   # vpc_id = var.vpc_id
    route {
        //associated subnet can reach everywhere
        cidr_block = "0.0.0.0/0" 
        //CRT uses this IGW to reach internet
        gateway_id = "${aws_internet_gateway.TF-prod-igw.id}" 
  }
  tags = {
     Name = "TF-prod-public-route_table"
  }
}
resource "aws_route_table" "prod-private-route_table" {
    vpc_id = "${aws_vpc.TF-prod-vpc.id}"
    
  tags = {
     Name = "prod-private-route_table"
  }
}
resource "aws_subnet" "public-subnet" {
  vpc_id     = aws_vpc.TF-prod-vpc.id
  cidr_block = var.public_subnet
  availability_zone = "ap-south-1a"
  tags = {
    Name = "public-subnet"
    Owner = "IT-Team"
  }
}
resource "aws_subnet" "private-subnet" {
  vpc_id     = aws_vpc.TF-prod-vpc.id
  cidr_block = var.private_subnet
  availability_zone = "ap-south-1b"
  tags = {
    Name = "private-subnet"
    Owner = "IT-Team"
  }
}
resource "aws_route_table_association" "prod-public-route_public-subnet"{
    subnet_id = "${aws_subnet.public-subnet.id}"
    route_table_id = "${aws_route_table.prod-public-route_table.id}"
}
resource "aws_route_table_association" "prod-public-route_private-subnet"{
    subnet_id = "${aws_subnet.private-subnet.id}"
    route_table_id = "${aws_route_table.prod-public-route_table.id}"
}