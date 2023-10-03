region             = "eu-central-1"
cidr               = "172.0.0.0/16"
ami_id             = "ami-01342111f883d5e4e"
instance_type      = "t2.micro"
sub_pub_cidr_list  = ["172.0.1.0/24", "172.0.2.0/24"]
sub_priv_cidr_list = ["172.0.3.0/24", "172.0.4.0/24"]
azs                = ["eu-central-1a", "eu-central-1b", "eu-central-1c"]
server             = "prod"