resource "aws_instance" "my-bastion-ec2" {
  ami = "ami-03a6eaae9938c858c"
  instance_type = "t2.micro"
  key_name = aws_key_pair.tf-key-pair.key_name
  vpc_security_group_ids = [aws_security_group.my-sg-ssh.id]
  associate_public_ip_address = true
  subnet_id = aws_subnet.pub1.id
  user_data = <<-EOF
              #!/bin/bash
              echo '${tls_private_key.rsa.private_key_pem}' > /home/ec2-user/tf.pem
              chmod 0400 /home/ec2-user/tf.pem
              EOF
tags = {
    Name = "tf-bastion-ec2"
  }

}

resource "aws_instance" "my-private-ec2" {
  ami = "ami-03a6eaae9938c858c"
  instance_type = "t2.micro"
  key_name = aws_key_pair.tf-key-pair.key_name
  vpc_security_group_ids = [aws_security_group.my-sg-ssh-vpc-cidr.id]
  subnet_id = aws_subnet.priv2.id

tags = {
    Name = "tf-private-ec2"
  }

}