# Create a Subnet
resource "aws_subnet" "vpc_prod_subnet1" {
  vpc_id     = aws_vpc.vpc_prod.id
  cidr_block = "172.16.1.0/24"
  map_public_ip_on_launch = true
  availability_zone = "us-west-1b"
  tags = {
    Name = "vpc_prod_subnet1"
  }
}

resource "aws_subnet" "vpc_prod_subnet2" {
  vpc_id     = aws_vpc.vpc_prod.id
  cidr_block = "172.16.2.0/24"
  map_public_ip_on_launch = true
  availability_zone = "us-west-1c"

  tags = {
    Name = "vpc_prod_subnet2"
  }
}

resource "aws_subnet" "vpc_prod_subnet3" {
  vpc_id     = aws_vpc.vpc_prod.id
  cidr_block = "172.16.3.0/24"
  map_public_ip_on_launch = true
  availability_zone = "us-west-1c"

  tags = {
    Name = "vpc_prod_subnet3"
  }
}

#associate subnet with route table
resource "aws_route_table_association" "subnet-route1" {
  subnet_id      = aws_subnet.vpc_prod_subnet1.id
  route_table_id = aws_route_table.vpc_prod_route1.id
}

resource "aws_route_table_association" "subnet-route2" {
  subnet_id      = aws_subnet.vpc_prod_subnet2.id
  route_table_id = aws_route_table.vpc_prod_route1.id
}

resource "aws_route_table_association" "subnet-route3" {
  subnet_id      = aws_subnet.vpc_prod_subnet3.id
  route_table_id = aws_route_table.vpc_prod_route1.id
}