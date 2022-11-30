resource "aws_instance" "blueapp" {
  ami                    = data.aws_ami.amazon-linux.id
  count                  = var.ec2_count
  key_name               = "mytfkey"
  instance_type          = var.ec2_instance_type
  user_data              = file("apache.tpl")
  vpc_security_group_ids = [aws_security_group.vpc-ssh-web.id]
  tags                   = var.ec2_tags
}