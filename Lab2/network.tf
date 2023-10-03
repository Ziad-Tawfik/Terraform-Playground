module "mynetwork" {
  source             = "./Network"
  cidr               = var.cidr
  sub_pub_cidr_list  = var.sub_pub_cidr_list
  sub_priv_cidr_list = var.sub_priv_cidr_list
  azs                = var.azs
}
