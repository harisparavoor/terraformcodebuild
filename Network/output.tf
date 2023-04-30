output "vpc_id" {
  value      = aws_vpc.TF-prod-vpc.id
}
output "private_subnet_id" {
  value = aws_subnet.private-subnet.id
}
output "public_subnet_id" {
  value = aws_subnet.public-subnet.id
}
output "TF_internet_gateway_id" {
  value = aws_internet_gateway.TF-prod-igw.id
}
output "public_route_table" {
  value = aws_route_table.prod-public-route_table.id
  }
  output "private_route_table" {
  value = aws_route_table.prod-private-route_table.id
  }