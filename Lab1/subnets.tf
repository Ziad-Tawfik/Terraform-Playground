
# Create 2 public subnets in 2 different availability zones
resource "aws_subnet" "pub1" {
  vpc_id     = aws_vpc.myvpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "tf-subnet-pub1-iti"
  }
}

resource "aws_subnet" "pub2" {
  vpc_id     = aws_vpc.myvpc.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "tf-subnet-pub2-iti"
  }
}

# Create 2 private subnets in 2 different availability zones
resource "aws_subnet" "priv1" {
  vpc_id     = aws_vpc.myvpc.id
  cidr_block = "10.0.3.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "tf-subnet-priv1-iti"
  }
}

resource "aws_subnet" "priv2" {
  vpc_id     = aws_vpc.myvpc.id
  cidr_block = "10.0.4.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "tf-subnet-priv2-iti"
  }
}

