# Create Application Load Balancer
resource "aws_lb" "wordpress_alb" {
    name               = "saeed-terraform-wordpress-alb"
    internal           = false
    load_balancer_type = "application"
    security_groups    = [var.ec2_sg_id]
    subnets            = var.subnets

    enable_deletion_protection = false

    tags = {
        Name = "saeed-terraform-wordpress-alb"
    }
}

# Create Target Group
resource "aws_lb_target_group" "wordpress_tg" {
  name        = "saeed-terraform-wordpress-tg"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = var.vpc_id

  tags = {
    Name = "saeed-terraform-wordpress-tg"
  }
}

# Create ALB Listener
resource "aws_lb_listener" "wordpress_http_listener" {
  load_balancer_arn = aws_lb.wordpress_alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.wordpress_tg.arn
  }
}

