
resource "aws_security_group" "TF-web-sg" {
  name        = "Security Group for Web Server"
  description = "Allow HTTPS inbound traffic"
  vpc_id      = var.vpc_id

  ingress {
    description      = "HTTPS from VPC"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = [var.vpc_cidr]
	}

	 ingress {
    description      = "HTTPS from VPC"
    from_port        = 9443
    to_port          = 9443
    protocol         = "tcp"
    cidr_blocks      = [var.vpc_cidr]
  }
  
  ingress {
    description      = "HTTPS from VPC"
    from_port        = 8080
    to_port          = 8080
    protocol         = "tcp"
    cidr_blocks      = [var.vpc_cidr]
  }

  ingress {
    description      = "HTTP from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = [var.vpc_cidr]
  }

	 ingress {
    description      = "HTTPS from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = [var.vpc_cidr]

 }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Web-SG"
  }
}
