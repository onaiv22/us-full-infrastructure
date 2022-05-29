resource "aws_s3_bucket" "log_bucket" {
    bucket = "${var.name}-alb-logs" 
    acl = "log-delivery-write"
}


resource "aws_lb" "main" {
    name = "${var.name}-alb"
    
    load_balancer_type = var.load_balancer_type
    internal = var.internal
    security_groups = var.security_groups
    subnets = var.subnets

    enable_deletion_protection = var.enable_deletion_protection
    
    ip_address_type = var.ip_address_type

    access_logs {
        bucket = aws_s3_bucket.log_bucket.bucket
        prefix = "alb-logs"
        enabled = true
    }

    tags = {
        Environment = "${var.environment}-alb-logs"
    }
}



