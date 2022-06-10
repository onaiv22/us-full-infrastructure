provider "aws" {
    region = var.region
    profile = var.profile
    #version = "2.60"
}

module "vpc" {
    source = "./modules/vpc"
    cidr_block = var.cidr_block
}

module "networking" {
    source = "./modules/networking"
    name   = local.name_prefix
    networks = var.project_networks
    vpc_id = module.vpc.vpc_id
    gw_id = module.vpc.gw_id
}

module "bastion-asg" {
    source                        = "./modules/asg" 
    name                          = local.name_prefix
    ami                           = var.ami
    vpc_id                        = module.vpc.vpc_id
    key_name                      = var.key_name
    user_data                     = filebase64("nginx-bootstrap.sh")
    security_group_id             = [module.networking.bastion-sg-id]
    which_subnet_ids              = module.networking.public_subnet_id
    launch_template_description   = "launch template for bastion instances"
    min_size                      = 1
    max_size                      = 2
    default_cooldown              = 3
    desired_capacity              = 1
    wait_for_capacity_timeout     = 0
}


module "container" {
    source = "./modules/container"
    name = "${local.name_prefix}-head"
}

module "acm" {
    source = "./modules/acm"
}

module "alb" {
    source      = "./modules/alb"
    name        = local.name_prefix
    cert        = module.acm.certificate
    subnets     = module.networking.public_subnet_id
    environment = var.environment
    vpc_id      = module.vpc.vpc_id
}


