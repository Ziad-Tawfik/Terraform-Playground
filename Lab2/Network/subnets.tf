# Create 2 public subnets in 2 different availability zones
resource "aws_subnet" "pub_sub" {
  count             = 2
  vpc_id            = aws_vpc.myvpc.id
  cidr_block        = var.sub_pub_cidr_list[count.index]
  availability_zone = var.azs[count.index]

  tags = {
    Name = "tf-subnet-pub${count.index + 1}-iti"
  }
}


# Create 2 private subnets in 2 different availability zones
resource "aws_subnet" "priv_sub" {
  count             = 2
  vpc_id            = aws_vpc.myvpc.id
  cidr_block        = var.sub_priv_cidr_list[count.index]
  availability_zone = var.azs[count.index]

  tags = {
    Name = "tf-subnet-priv${count.index + 1}-iti"
  }
}

