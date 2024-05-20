provider "aws" {
    region = var.region
}

module "vpc" {
    source = "./modules/vpc"
    availability_zone = var.availability_zone
}

module "ec2" {
    source            = "./modules/ec2"
    ami               = "ami-097d91964456c7d1a"
    vpc_id            = module.vpc.vpc_id
    public_subnet_id  = module.vpc.public_subnet_id
    private_subnet_id = module.vpc.private_subnet_id
}

module "mysql" {
    source   = "./modules/mysql"
    vpc_id   = module.vpc.vpc_id
    subnet_id = module.vpc.public_subnet_id # TODO: Change this to private subnet
}
