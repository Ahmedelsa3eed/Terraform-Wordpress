resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.main.id
    tags = {
        Name = var.internet_gateway_name
    }
}

resource "aws_route_table" "public-route" {
    vpc_id = aws_vpc.main.id
    tags = {
        Name = var.public_route_name
    }
}

resource "aws_route" "igw-route" {
    route_table_id            = aws_route_table.public-route.id
    destination_cidr_block    = var.cidr_from_anywhere
    gateway_id                = aws_internet_gateway.igw.id
}

resource "aws_route_table_association" "public_association" {
    subnet_id      = aws_subnet.public.id  
    route_table_id = aws_route_table.public-route.id
}

resource "aws_route_table_association" "public_association-2" {
    subnet_id      = aws_subnet.public_2.id  
    route_table_id = aws_route_table.public-route.id
}

########### pirvate subnets #########

resource "aws_route_table" "private-route" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = var.private_route_name
  }

}
resource "aws_route" "igw-route-2" {
  route_table_id            = aws_route_table.private-route.id
  destination_cidr_block    = var.cidr_from_anywhere
  gateway_id                = aws_nat_gateway.nat-gw.id
}

resource "aws_route_table_association" "private_association-1" {
  subnet_id      = aws_subnet.private.id
  route_table_id = aws_route_table.private-route.id
}

resource "aws_eip" "eip" {
    domain = "vpc"
}

resource "aws_nat_gateway" "nat-gw" {
  allocation_id = aws_eip.eip.id
  subnet_id     = aws_subnet.public.id 

  tags = {
    Name = var.natgateway_name
  }

  depends_on = [aws_internet_gateway.igw]
}