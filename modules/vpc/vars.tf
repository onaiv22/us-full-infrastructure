variable "cidr_block" {
    type = string 
    description = "Cidr block for the network"
    default = "198.162.0.0/16"
}

variable "instance_tenancy" {
    type = string 
    description = "Tenancy of instances spin up within VPC"
    default = "default"
}

variable "enable_dns_hostnames" {
    type = string 
    description = "Whether or not the VPC has DNS hostname support"
    default = "true"
}

