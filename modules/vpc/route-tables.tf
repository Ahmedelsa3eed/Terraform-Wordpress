resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.main.id
    tags = {
        Name = "saeed-terraform-igw"
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
    destination_cidr_block    = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
}

resource "aws_route_table_association" "public_association" {
    subnet_id      = aws_subnet.public.id  
    route_table_id = aws_route_table.public-route.id
}

resource "aws_route_table_association" "public_association-2" {
    subnet_id      = aws_subnet.public-2.id  
    route_table_id = aws_route_table.public-route.id
}