provider "aws" {
  region = "ap-south-1"
}
variable "instance_count" {
  type    = number
  default = 2
}
variable "instance_ami" {
  type    = string
  default = "ami-0a2959dc023f72880"
}
variable "instance_type" {
  type    = string
  default = "t3.small"
}
variable "instance_name" {
  type    = string
  default = "TFServer"
}
resource "aws_instance" "myinstance" {
  count         = var.instance_count
  ami           = var.instance_ami
  instance_type = var.instance_type
  tags = {
    Name = var.instance_name
  }
}
