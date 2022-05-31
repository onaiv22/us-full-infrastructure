resource "aws_autoscaling_group" "main" {
    name = "${var.name}-asg"
    
    vpc_zone_identifier = var.which_subnet_ids
    
    min_size = var.min_size
    max_size = var.max_size
    desired_capacity = var.desired_capacity
    
    
    min_elb_capacity = var.min_elb_capacity
    wait_for_elb_capacity = var.wait_for_elb_capacity
    wait_for_capacity_timeout = var.wait_for_capacity_timeout 
    default_cooldown = var.default_cooldown
    protect_from_scale_in = var.protect_from_scale_in
    target_group_arns = var.target_group_arns # put the target group arn of the alb here
    health_check_type = var.health_check_type
    health_check_grace_period = var.health_check_grace_period

    force_delete = var.force_delete
    termination_policies = var.termination_policies
    max_instance_lifetime = var.max_instance_lifetime
    suspended_processes = var.suspended_processes
    service_linked_role_arn = var.service_linked_role_arn

    launch_template {
        id = aws_launch_template.main.id
        version = "$Latest"
    }

    lifecycle {
      create_before_destroy = true
    }
}







