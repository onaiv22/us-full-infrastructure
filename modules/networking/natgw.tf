resource "aws_eip" "nat_gw_ip" {
    count = length(var.nat_gateways) > 0 ? 0 : length(var.networks["public_subnets"])
    vpc = true
}

resource "aws_nat_gateway" "nat_gw" {
    count = length(var.nat_gateways) > 0 ? 0 : length(var.networks["public_subnets"])
    allocation_id = element(aws_eip.nat_gw_ip.*.id, count.index)
    subnet_id = element(aws_subnet.public_subnets.*.id, count.index)

    tags = {
        Name = "private_nat_gateway-${count.index}"
    }
}

