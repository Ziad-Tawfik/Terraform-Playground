resource "aws_route_table" "my-rtb-pub" {
  vpc_id = aws_vpc.myvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.myigw.id
  }

  tags = {
    Name = "tf-rtb-public"
  }
}

resource "aws_route_table" "my-rtb-priv" {
  vpc_id = aws_vpc.myvpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.mynatgw.id
  }

  tags = {
    Name = "tf-rtb-private"
  }
}

resource "aws_route_table_association" "pub-rtb-association" {
  count          = 2
  subnet_id      = aws_subnet.pub_sub[count.index].id
  route_table_id = aws_route_table.my-rtb-pub.id
}

resource "aws_route_table_association" "priv-rtb-association" {
  count          = 2
  subnet_id      = aws_subnet.priv_sub[count.index].id
  route_table_id = aws_route_table.my-rtb-priv.id
}