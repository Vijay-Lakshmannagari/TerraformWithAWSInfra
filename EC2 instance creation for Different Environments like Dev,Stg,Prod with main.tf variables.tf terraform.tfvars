main.tf
---------------------------------------------

provider "aws" {
  region = "ap-south-1"
}
resource "aws_instance" "myinstance" {
  count         = var.instance_count
  ami           = var.instance_ami
  instance_type = var.instance_type
  tags = {
    Name = var.instance_name
  }
}

------------------------------------------------
variables.tf
------------------------------------------------
variable "instance_count" {
  type    = number
}
variable "instance_ami" {
  type    = string
}
variable "instance_type" {
  type    = string
}
variable "instance_name" {
  type    = string
}


--------------------------------------------------
Dev.tfvars Stg.tfvars Prod.tfvars
--------------------------------------------------
instance_count = 1
instance_ami = "ami-0a2959dc023f72880"
instance_type = "t3.small"
instance_name = "DevServer"

---------------------------------------------------

instance_count = 1
instance_ami = "ami-0a2959dc023f72880"
instance_type = "s3.small"
instnce_name = "PreprodServer"

-------------------------------------------------

instance_count = 1
instance_ami = "ami-0a2959dc023f72880"
instance_type = "t3.small"
instance_name = "ProdServer"

