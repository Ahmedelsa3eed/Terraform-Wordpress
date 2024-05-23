provider "aws" {
    region = var.region
}

module "vpc" {
	source = "./modules/vpc"
}

module "ec2" {
    source            = "./modules/ec2"
    ami               = "ami-04b70fa74e45c3917"
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
    
	triggers = {
        mysql_private_ip = module.mysql.mysql_private_ip
    }
	
    depends_on = [module.mysql]
}

resource "null_resource" "refresh-auto-scaling-group" {
    provisioner "local-exec" {
        command = "aws autoscaling start-instance-refresh --auto-scaling-group-name $ASG_NAME"

        environment = {
            ASG_NAME = module.ec2.auto_scaling_group_name
        }
    }

    triggers = {
        mysql_private_ip = module.mysql.mysql_private_ip
    }
}