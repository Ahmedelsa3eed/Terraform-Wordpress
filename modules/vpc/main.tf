resource "aws_vpc" "main" {
    cidr_block = "10.0.0.0/16"

    tags = {
        Name = "saeed-terraform-vpc"
    }
}

resource "aws_subnet" "public" {
    vpc_id            = aws_vpc.main.id
    cidr_block        = "10.0.4.0/24"
    map_public_ip_on_launch = true
    availability_zone = var.availability_zone

    tags = {
        Name = "saeed-terraform-public"
    }
}
resource "aws_subnet" "private" {
    vpc_id     = aws_vpc.main.id
    cidr_block = "10.0.2.0/24"
    availability_zone = var.availability_zone

    tags = {
        Name = "saeed-terraform-private"
    }
}

resource "aws_subnet" "public_2" {
    vpc_id            = aws_vpc.main.id
    cidr_block        = "10.0.3.0/24"
    map_public_ip_on_launch = true
    availability_zone = var.availability_zone_2

    tags = {
        Name = "saeed-terraform-public-2"
    }
}
