resource "aws_vpc" "blueapp_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = "true" #gives you an internal domain name
  enable_dns_hostnames = "true" #gives you an internal host name
  instance_tenancy     = "default"
  tags = {
    "Name" = "${var.vpc_tags}-${terraform.workspace}-vpc"
  }
}
resource "aws_subnet" "blueapp_sn_pub" {
  vpc_id                  = aws_vpc.blueapp_vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true
  tags = {
    "Name" = "${var.vpc_tags}-${terraform.workspace}-sn"
  }
}
resource "aws_internet_gateway" "blueapp_igw" {
  vpc_id = aws_vpc.blueapp_vpc.id
}
resource "aws_route_table" "blueapp_rt" {
  vpc_id = aws_vpc.blueapp_vpc.id
}
resource "aws_route" "blueapp_r" {
  route_table_id         = aws_route_table.blueapp_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.blueapp_igw.id
}
resource "aws_route_table_association" "blueapp_rta" {
  route_table_id = aws_route_table.blueapp_rt.id
  subnet_id      = aws_subnet.blueapp_sn_pub.id
}