variable "profile" {}
variable "region" {}
variable "environment" {}
//variable "vpc_id" {}
variable "cidr_block" {
    type = string 
    description = "Cidr block for the network"
    default = "10.0.0.0/16"
}
variable "ami" {}

variable "enable_dns_support" {
    type = string 
    description = "Whether or not the VPC has DNS support"
    default = "true"
}

variable "project_networks" {
    type = map(any)
}

variable "key_name" {}


