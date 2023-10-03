# Create an internet gw
resource "aws_internet_gateway" "myigw" {
  vpc_id = aws_vpc.myvpc.id

  tags = {
    Name = "tf-igw-iti"
  }
}

# Create elastic ip
resource "aws_eip" "myeip" {
  domain = "vpc"

  tags = {
    Name = "tf-eip-iti"
  }
}

# Create Nat gw
resource "aws_nat_gateway" "mynatgw" {
  allocation_id = aws_eip.myeip.id
  subnet_id     = aws_subnet.pub_sub[0].id

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
