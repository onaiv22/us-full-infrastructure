resource "aws_subnet" "private_subnets" {
    count = length(var.networks["zones"])
    vpc_id = var.vpc_id  
    availability_zone = element(var.networks["zones"], count.index) 
    cidr_block = element(var.networks["private_subnets"], count.index)
    map_public_ip_on_launch = false 
    
    tags = {
        "Name" = element(var.networks["private_subnet_names"], count.index)
    }
}

resource "aws_subnet" "public_subnets" {
    count = length(var.networks["zones"])
    vpc_id = var.vpc_id  
    availability_zone = element(var.networks["zones"], count.index) 
    cidr_block = element(var.networks["public_subnets"], count.index)
    map_public_ip_on_launch = true
    
    tags = {
        "Name" = element(var.networks["public_subnet_names"], count.index)
    }
}
