output "lb_arn" {
  value = aws_lb.wordpress_alb.arn
}

output "load_balancer_dns_name" {
    description = "LoadBalancer dns name"
    value = aws_lb.wordpress_alb.dns_name
}

output "launch_template_latest_version" {
  value = aws_launch_template.wordpress.latest_version
}