resource "aws_instance" "my-bastion-ec2" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  key_name                    = aws_key_pair.tf-key-pair.key_name
  vpc_security_group_ids      = [aws_security_group.my-sg-ssh.id]
  associate_public_ip_address = true
  subnet_id                   = module.mynetwork.pub_subnets[0].id
  user_data                   = <<-EOF
              #!/bin/bash
              echo '${tls_private_key.rsa.private_key_pem}' > /home/ec2-user/tf.pem
              chmod 0400 /home/ec2-user/tf.pem
              EOF
  provisioner "local-exec" {
    command = "echo ${self.public_ip} > bastion_host_ip"
  }

  tags = {
    Name = "tf-bastion-ec2"
  }

}

resource "aws_instance" "my-private-ec2" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = aws_key_pair.tf-key-pair.key_name
  vpc_security_group_ids = [aws_security_group.my-sg-ssh-vpc-cidr.id]
  subnet_id              = module.mynetwork.priv_subnets[0].id

  tags = {
    Name = "tf-private-ec2"
  }

}