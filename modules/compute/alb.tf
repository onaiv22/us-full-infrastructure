resource "aws_s3_bucket" "log_bucket" {
    bucket = var.bucket_name 
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

resource "aws_lb_target_group" "main" {
    name = "${var.name}-tg"
    protocol = "HTTP"
    port = 80
    vpc_id = var.vpc_id
    target_type = "instance"

    health_check = {
        enabled = true 
        path = "/"
        port = "traffic-port"
        health_threshold = 2
        unhealthy_threshold = 3
        interval = 15
        timeout = 10
        protocol = "HTTP"
        matcher = "200"
    }
}

resource "aws_lb_listener" "main" {
    load_balancer_arn = aws_lb.main.arn 
    port = "80"
    protocol = "HTTP"

    default_action {
        type = "forward"
        target_group_arn = aws_lb_target_group.main.arn
    }
  
}

