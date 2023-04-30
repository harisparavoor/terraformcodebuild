
#resource "aws_instance" "web1" {
#  count = 1
# ami           = var.windows_ami
# instance_type = var.instance_type
 # subnet_id     = var.public_subnet_id
 # key_name = var.public_key
 # security_groups = [aws_security_group.web-sg.id]
  #root_block_device {
    #volume_size = 30
   # volume_type = "gp3"
    #tags = {
      #Name = "Web1"
#}
#}
# tags = {
#  Name = "Web1"
#}
#}

resource "aws_instance" "web2" {
  count = 1
  ami           = var.amazon_linux_ami
  instance_type = var.instance_type
  subnet_id     = var.private_subnet_id
  key_name = var.public_key
  #security_groups = [aws_security_group.web-sg.id]
  vpc_security_group_ids = ["${aws_security_group.TF-web-sg.id}"]
  iam_instance_profile = var.instance_iam_profile
  associate_public_ip_address = false
  root_block_device {
    volume_size = 12
    volume_type = "gp3"
    tags = {
      Name = "Web2"
}
}
  tags = {
    Name = "Web2"
  }
}
#resource block for eip #
resource "aws_eip" "TF-eip" {
vpc = true
tags = {
    Name = "TF-eip"
  }
}
#resource "aws_eip_association" "TF-eip" {
#instance_id = var.instance_web2_id
#instance_id   = aws_instance.web2[0].id
#allocation_id = aws_eip.TF-eip.id
#}
resource "aws_eip_association" "eip_public_ip" {
instance_id   = aws_instance.web2[0].id
allocation_id = var.public_ip
}