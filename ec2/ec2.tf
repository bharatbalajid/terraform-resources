resource "aws_instance" "blueapp" {
  ami                    = data.aws_ami.amazon-linux.id
  count                  = terraform.workspace == "default" ? 2:1
  key_name               = "mytfkey"
  instance_type          = var.ec2_instance_type
  user_data              = file("apache.sh")
  vpc_security_group_ids = [aws_security_group.vpc-ssh-web.id]
  tags                   = {
  Name = "${var.ec2_tags}-${terraform.workspace}-${count.index}"
  name = "vm-${terraform.workspace}-${count.index}"
  }
}