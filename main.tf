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
    networks = var.project_networks
    vpc_id = module.vpc.vpc_id
    gw_id = module.vpc.gw_id
}

module "container" {
    source = "./modules/container"
    name = "${local.name_prefix}-head"
}