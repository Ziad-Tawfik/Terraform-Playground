variable "cidr" {
  type        = string
  default     = "10.0.0.0/16"
  description = "vpc cidr block"
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
