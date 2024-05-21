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