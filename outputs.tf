output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnet_id" {
  value = module.networking.public_subnet_id
}

output "private_subnet_id" {
  value = module.networking.private_subnet_id
}

output "bastion-sg-id" {
    value = module.networking.bastion-sg-id
}

output "alb-sg-id" {
    value = module.networking.alb-sg-id
}