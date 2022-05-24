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

module "acm" {
    source = "./modules/acm"
    providers = {
        aws = aws.useast1
    }  

}

module "compute" {
    source = "./modules/compute"
    name = "${local.name_prefix}-asg"
    vpc_id = module.vpc.vpc_id
    ami = var.ami
    //environment = var.environment

    min_size = 1
    max_size = 2
    default_cooldown = 3
    desired_capacity = 1
    wait_for_capacity_timeout = 0
    //enable_monitoring = true
    key_name = var.key_name
    //vpc_zone_identifier = module.networking.private_subnets.id

    //capacity_rebalance = "disabled"
    //target_group_arn = "" # have left this as an empty string for now, ones we have alb and tg settings in put this in
    health_check_type = "EC2"
    health_check_grace_period = 300
    termination_policies = ["OldestInstance"] # could be any of this - OldestInstance, NewestInstance, OldestLaunchConfiguration, ClosestToNextInstanceHour, OldestLaunchTemplate, AllocationStrategy, Default.

    launch_template_name = "${local.name_prefix}-lt"
    launch_template_description = "The launch template for ${local.name_prefix}-lt"
    default_version = "$Latest"
    user_data = ""
    private_subnet_ids = module.networking.private_subnet_id
    
    
    
}

