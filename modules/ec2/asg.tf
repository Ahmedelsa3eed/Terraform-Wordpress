resource "aws_autoscaling_group" "wordpress" {
    name                 = "saeed-terraform-wordpress-asg"
    desired_capacity     = 1
    max_size             = 1
    min_size             = 1
    vpc_zone_identifier  = [var.public_subnet_id]

    launch_template {
        id      = aws_launch_template.wordpress.id
        version = "$Latest"
    }

    tag {
        key                 = "Name"
        value               = "saeed-terraform-wordpress"
        propagate_at_launch = true
    }
}