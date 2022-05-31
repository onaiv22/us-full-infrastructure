profile   = "devops-engineer"
region    = "us-east-1"
environment = "notprod"
key_name = "dev-key"
ami       = "ami-d06ef2c7" #ami-0022f774911c1d690

# VPC Networking range
vpc_cidr = "10.0.0.0/16"

project_networks = {
    zones = [
        "us-east-1a",
        "us-east-1b",
        "us-east-1c",
        
    ],
    private_subnets = [
        "10.0.1.0/24",
        "10.0.2.0/24",
        "10.0.3.0/24",
    ],
    private_subnet_names = [
        "app-101",
        "app-102",
        "app-103",
    ],
    public_subnets = [
        "10.0.4.0/24",
        "10.0.5.0/24",
        "10.0.6.0/24",
    ],
    public_subnet_names = [
        "mgt-101",
        "mgt-102",
        "mgt-103",
    ]
}

load_balancer_type = "application"
internal = false
enable_deletion_protection = false
idle_timeouts = 600


