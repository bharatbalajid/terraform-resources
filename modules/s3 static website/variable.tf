variable "region" {
  type    = string
  default = "us-east-1"
}

variable "bucket_name" {
  type    = string
  default = ""
}
variable "bucket_tags" {
  type = map(string)
  default = {
  }
}