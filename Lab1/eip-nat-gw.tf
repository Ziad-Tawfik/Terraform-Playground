resource "aws_eip" "myeip" {
  domain = "vpc"

  tags = {
    Name = "tf-eip-iti"
  }
}

resource "aws_nat_gateway" "mynatgw" {
  allocation_id = aws_eip.myeip.id
  subnet_id = aws_subnet.pub1.id

  tags = {
    Name = "tf-nat-gw"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [
    aws_internet_gateway.myigw,
    aws_eip.myeip 
    ]
}
