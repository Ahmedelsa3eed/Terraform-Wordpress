resource "aws_instance" "mysql" {
    ami           = "ami-04868818694d21658"  # Ubuntu 22.04 with MySQL 8.0
    instance_type = "t2.micro"
    subnet_id     = var.subnet_id
    security_groups = [aws_security_group.mysql_sg.id]

    user_data = filebase64("${path.module}/user-data.sh")

    tags = {
        Name = "saeed-mysql"
    }
}