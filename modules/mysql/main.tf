resource "aws_instance" "mysql" {
    ami           = "ami-0462b88b7793a59e7"  # Ubuntu 22.04 with MySQL 8.0
    instance_type = "t3.small"
    key_name      = "saeed-project-key"
    subnet_id     = var.subnet_id
    vpc_security_group_ids = [var.mysql_sg_id]

    user_data = filebase64("${path.module}/user-data.sh")

    provisioner "local-exec" {
        command = "echo '${aws_instance.mysql.private_ip}' > mysql_private_ip"
    }

    lifecycle {
        prevent_destroy = true
    }

    tags = {
        Name = "saeed-mysql"
    }
}