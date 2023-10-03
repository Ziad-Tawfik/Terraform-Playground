region             = "us-east-1"
cidr               = "10.0.0.0/16"
ami_id             = "ami-03a6eaae9938c858c"
instance_type      = "t2.micro"
sub_pub_cidr_list  = ["10.0.1.0/24", "10.0.2.0/24"]
sub_priv_cidr_list = ["10.0.3.0/24", "10.0.4.0/24"]
azs                = ["us-east-1a", "us-east-1b", "us-east-1c", "us-east-1d", "us-east-1e", "us-east-1f"]
server             = "dev"