output "vpc_ipv6_cidr_block" {
  description = "The IPv6 CIDR block"
  value = try(aws_vpc.main.ipv6_cidr_block, "")
}

output "vpc_id" {
  value = aws_vpc.main.id
}

output "gw_id" {
  value = aws_internet_gateway.main.id
}

