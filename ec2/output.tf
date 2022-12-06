output "ec2_publicip" {
  value = aws_instance.blueapp.*.public_ip
}
output "ec2_public_dns" {
  value     = "http:\\${aws_instance.blueapp.*.public_dns}"
  sensitive = false
}