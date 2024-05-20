resource "aws_security_group" "saeed_terraform_sg" {
    name_prefix = "saeed-terraform-sg-"
    vpc_id      = var.vpc_id

    ingress {
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port   = 443
        to_port     = 443
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = "saeed-terraform-sg"
    }
}

resource "aws_launch_template" "wordpress" {
    name_prefix   = "saeed-terraform-wordpress-template"
    image_id      = var.ami
    instance_type = "t3.small"
    key_name      = "saeed-project-key"

    network_interfaces {
        subnet_id       = var.public_subnet_id
        security_groups = [aws_security_group.saeed_terraform_sg.id]
    }

    tag_specifications {
        resource_type = "instance"

        tags = {
            Name = "saeed-terraform-wordpress"
        }
    }
}

resource "aws_autoscaling_group" "wordpress" {
    name                 = "saeed-terraform-wordpress-asg"
    desired_capacity     = 2
    max_size             = 2
    min_size             = 2
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

# resource "aws_autoscaling_policy" "cpu_policy" {
#     name                   = "cpu-policy"
#     scaling_adjustment     = 1
#     adjustment_type        = "ChangeInCapacity"
#     cooldown               = 300
#     autoscaling_group_name = aws_autoscaling_group.wordpress.name

#     policy_type = "SimpleScaling"

#     step_adjustment {
#         metric_interval_lower_bound = 0
#         scaling_adjustment          = 1
#     }

#     alarm {
#         comparison_operator = "GreaterThanOrEqualToThreshold"
#         evaluation_periods  = 2
#         metric_name         = "CPUUtilization"
#         namespace           = "AWS/EC2"
#         period              = 120
#         statistic           = "Average"
#         threshold           = 50

#         dimensions = {
#         AutoScalingGroupName = aws_autoscaling_group.wordpress.name
#         }
#     }
# }
