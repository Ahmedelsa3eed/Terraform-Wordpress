provider "aws" {
    region = var.region
}

module "vpc" {
	source = "./modules/vpc"
}

module "ec2" {
    source            = "./modules/ec2"
    ami               = "ami-097d91964456c7d1a"
    vpc_id            = module.vpc.vpc_id
    ec2_sg_id         = module.vpc.ec2_sg_id
    subnets  		  = [module.vpc.public_subnet_id, module.vpc.public_subnet_id_2]
	public_subnet_id  = module.vpc.public_subnet_id
}

module "mysql" {
    source      = "./modules/mysql"
    vpc_id      = module.vpc.vpc_id
    subnet_id   = module.vpc.private_subnet_id
    mysql_sg_id = module.vpc.mysql_sg_id
}

resource "null_resource" "update-docker-compose" {
    provisioner "local-exec" {
        command = "bash ./update_docker_compose.sh"
    }
	
    depends_on = [module.mysql]
}