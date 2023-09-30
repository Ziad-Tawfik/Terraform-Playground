# Create a VPC
resource "aws_vpc" "myvpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "tf-vpc-iti"
  }
}

# Create an internet gw
resource "aws_internet_gateway" "myigw" {
  vpc_id = aws_vpc.myvpc.id

  tags = {
    Name = "tf-igw-iti"
  }
}
