resource "aws_route_table" "vpc_prod_route1" {
  vpc_id = aws_vpc.vpc_prod.id

  route {
    # Associated subnet can reach public internet
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.vpc_prod_igw.id
  }

  tags = {
    Name = "vpc_prod_route1"
  }
}

