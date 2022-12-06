resource "aws_vpc" "blueapp_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    "name" = "${var.vpc_tags}-${terraform.workspace}"
  }
}
resource "aws_subnet" "blueapp_sn_pub" {
  vpc_id = aws_vpc.blueapp_vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = var.region
  map_public_ip_on_launch = true
}
resource "aws_internet_gateway" "blueapp_igw" {
  vpc_id = aws_vpc.blueapp_vpc.id
}
resource "aws_route_table" "blueapp_rt" {
  vpc_id = aws_vpc.blueapp_vpc.id
}
resource "aws_route" "blueapp_r" {
  route_table_id = aws_route_table.blueapp_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.blueapp_igw.id
}
resource "aws_route_table_association" "blueapp_rta" {
  route_table_id = aws_route_table.blueapp_rt.id
  subnet_id = aws_subnet.blueapp_sn_pub.id
}