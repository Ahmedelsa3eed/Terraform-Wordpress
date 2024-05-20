provider "aws" {
    region = var.region
}

module "vpc" {
    source = "./modules/vpc"
    availability_zone = var.availability_zone
}

module "ec2" {
    source            = "./modules/ec2"
    ami               = "ami-0a190397c4bdb7426"
    vpc_id            = module.vpc.vpc_id
    public_subnet_id  = module.vpc.public_subnet_id
    private_subnet_id = module.vpc.private_subnet_id
}
