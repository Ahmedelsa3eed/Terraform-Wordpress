variable "vpc_id" {
    description = "The ID of the VPC"
}

variable "ec2_sg_id" {
    description = "The ID of the EC2 security group"
}

variable "subnets" {
    description = "The ID of the public subnet"
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
