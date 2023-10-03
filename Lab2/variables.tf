variable "region" {
  type        = string
  description = "The AWS region to create resources in."
  default     = "us-east-1"
}

variable "cidr" {
  type        = string
  default     = "10.0.0.0/16"
  description = "vpc cidr block"
}

variable "ami_id" {
  type        = string
  description = "ec2 instance ami id"
}

variable "instance_type" {
  type        = string
  description = "ec2 instance type"
  default     = "t2.micro"
}

variable "sub_pub_cidr_list" {
  type = list(any)
}

variable "sub_priv_cidr_list" {
  type = list(any)
}

variable "azs" {
  type = list(any)
}

variable "server" {
  type = string
}

