output "pub_subnets" {
  value = aws_subnet.pub_sub
}

output "priv_subnets" {
  value = aws_subnet.priv_sub
}

output "vpc" {
  value = aws_vpc.myvpc
}