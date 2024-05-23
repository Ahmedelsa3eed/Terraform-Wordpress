resource "aws_instance" "mysql" {
    ami                    = "ami-0e001c9271cf7f3b9"  # Ubuntu 22.04
    instance_type          = "t3.small"
    key_name               = "saeed-project-key"
    subnet_id              = var.subnet_id
    vpc_security_group_ids = [var.mysql_sg_id]
    user_data_replace_on_change = true
    
    user_data_base64 = filebase64("${path.module}/user-data.sh")

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