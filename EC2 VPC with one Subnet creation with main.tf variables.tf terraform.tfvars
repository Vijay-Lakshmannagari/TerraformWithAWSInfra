main.tf
-----------------------------
provider "aws" {
  region = "ap-south-1"
}
resource "aws_vpc" "myvpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = var.vpc_name
  }
}
resource "aws_subnet" "mysubnet" {
  vpc_id            = aws_vpc.myvpc.id
  cidr_block        = var.subnet_cidr
  availability_zone = var.availability_zone
  tags = {
    Name = var.subnet_name
  }
}
resource "aws_instance" "myinstance" {
  subnet_id     = aws_subnet.mysubnet.id
  ami           = "ami-0a2959dc023f72880"
  instance_type = "t3.small"
  tags = {
    Name = var.instance_name
  }
}


-----------------------------------------------------
variables.tf
----------------------------------------------------
variable "vpc_name" {
  description = "VPC Name"
  type        = string
}
variable "vpc_cidr" {
  description = "VPC cidr Block"
  type        = string
}
variable "subnet_name" {
  description = "Name of the subnet"
  type        = string
}
variable "subnet_cidr" {
  description = "subnet cidr block"
  type        = string
}
variable "availability_zone" {
  description = "availability zone"
  type        = string
}
variable "instance_name" {
  description = "instance name"
  type        = string
}

--------------------------------------------------------
terraform.tfvars
--------------------------------------------------------
vpc_name          = "Dev_VPC"
vpc_cidr          = "192.168.0.0/16"
subnet_name       = "app-subnet"
subnet_cidr       = "192.168.1.0/24"
availability_zone = "ap-south-1a"
instance_name     = "ChinnuBannu"





