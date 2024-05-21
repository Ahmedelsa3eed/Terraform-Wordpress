resource "aws_instance" "mysql" {
    ami           = "ami-04868818694d21658"  # Ubuntu 22.04 with MySQL 8.0
    instance_type = "t3.small"
    subnet_id     = var.subnet_id
    security_groups = [var.mysql_sg_id]

    user_data = filebase64("${path.module}/user-data.sh")

    provisioner "local-exec" {
        command = "echo '${aws_instance.mysql.private_ip}' > mysql_private_ip"
    }

    tags = {
        Name = "saeed-mysql"
    }
}