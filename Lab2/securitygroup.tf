resource "aws_security_group" "my-sg-ssh" {
  name        = "allow-all-sg-ssh"
  description = "Allow ssh to the server"
  vpc_id      = module.mynetwork.vpc.id
  ingress {
    description = "SSH ingress"
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "tf-security-group-ssh"
  }
}

resource "aws_security_group" "my-sg-ssh-vpc-cidr" {
  name        = "allow-all-sg-ssh-vpc-cidr"
  description = "Allow ssh to the server"
  vpc_id      = module.mynetwork.vpc.id
  ingress {
    description = "SSH ingress"
    cidr_blocks = [module.mynetwork.vpc.cidr_block]
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
  }
  ingress {
    description = "3000 ingress"
    cidr_blocks = [module.mynetwork.vpc.cidr_block]
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "tf-security-group-ssh-3000"
  }

}