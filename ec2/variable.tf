/*variable "ami_id" {
  type    = string
  default = "ami-0b0dcb5067f052a63"
  validation {
    condition     = length(var.ami_id) > 4 && substr(var.ami_id, 0, 4) == "ami-"
    error_message = "Invalid AMI ID, Please Check Again"
  }
}*/

variable "region" {
  type    = string
  default = "us-east-1"
}

variable "ec2_count" {
  type    = number
  default = 1
}
variable "ec2_instance_type" {
  type    = string
  default = "t2.micro"
}
variable "ec2_tags" {
  type = string
  default = "Blueapp"
  }
  variable "vpc_tags" {
    type = string
    default = "Blueapp"
  }

