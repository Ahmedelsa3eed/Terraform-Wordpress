variable "vpc_id" {
    description = "The ID of the VPC"
}

variable "ec2_sg_id" {
    description = "The ID of the EC2 security group"
}

variable "subnets" {
    description = "The ID of the public subnet"
    type = list(string)
}

variable "public_subnet_id" {
    description = "The ID of the public subnet"
}

variable "private_subnet_id" {
    description = "The ID of the private subnet"
}

variable "ami" {
    description = "The AMI to use for the EC2 instance"
}

output "load_balancer_dns_name" {
    description = "LoadBalancer dns name"
    value = aws_lb.wordpress_alb.dns_name
}
