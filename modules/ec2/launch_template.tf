resource "aws_launch_template" "wordpress" {
    name          = "saeed-terraform-wordpress-template"
    image_id      = var.ami
    instance_type = "t3.medium"
    key_name      = "saeed-project-key"

    network_interfaces {
        subnet_id       = var.public_subnet_id
        security_groups = [var.ec2_sg_id]
    }

    tag_specifications {
        resource_type = "instance"

        tags = {
            Name = "saeed-terraform-wordpress"
        }
    }

    user_data = filebase64("${path.module}/user-data.sh")
}
