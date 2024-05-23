variable "availability_zone" {
    description = "The availability zone to deploy in"
    default     = "us-east-1a"
}

variable "availability_zone_2" {
    description = "The second availability zone to deploy in"
    default     = "us-east-1b"
}

variable "public_route_name" {
    default = "saeed-terraform-public-route"
}

variable "private_route_name" {
    default = "saeed-terraform-private-route"
}

variable "cidr_from_anywhere" {
    default = "0.0.0.0/0"
}

variable "natgateway_name" {
    default = "saeed-terraform-ngw"
}

variable "internet_gateway_name" {
    default = "saeed-terraform-igw"
}