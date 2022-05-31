output "public_subnet_id" {
  value = aws_subnet.public_subnets.*.id
}

output "private_subnet_id" {
  value = aws_subnet.private_subnets.*.id
}

output "bastion-sg-id" {
    value = aws_security_group.bastion.id
}

output "alb-sg-id" {
    value = aws_security_group.alb.id
}
