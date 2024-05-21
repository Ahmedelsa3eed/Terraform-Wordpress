resource "aws_launch_template" "wordpress" {
    name   = "saeed-terraform-wordpress-template"
    image_id      = var.ami
    instance_type = "t3.small"
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
