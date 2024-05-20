variable "region" {
    description = "The AWS region to deploy in"
    default     = "us-east-1"
}

variable "availability_zone" {
    description = "The availability zone to deploy in"
    default     = "us-east-1a"
}

variable "db_name" {
    description = "The name of the RDS database"
    default     = "wordpressdb"
}

variable "db_username" {
    description = "The username for the RDS database"
    default     = "admin"
}

variable "db_password" {
    description = "The password for the RDS database"
    default     = "password"
}
