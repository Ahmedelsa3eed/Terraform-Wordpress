output "vpc_id" {
    value = aws_vpc.main.id
}

output "ec2_sg_id" {
    value = aws_security_group.ec2_sg.id
}

output "mysql_sg_id" {
    value = aws_security_group.mysql_sg.id
}

output "public_subnet_id" {
    value = aws_subnet.public.id
}

output "public_subnet_id_2" {
    value = aws_subnet.public.id
}

output "private_subnet_id" {
    value = aws_subnet.private.id
}