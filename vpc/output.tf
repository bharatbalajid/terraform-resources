output "myvpc" {
  value = aws_vpc.blueapp_vpc.*.id
}
output "mysb" {
  value = aws_subnet.blueapp_sn_pub.*.id
}