resource "aws_launch_template" "main" {
    name = "${var.name}-launch-template"
    description = var.launch_template_description
    image_id = var.ami
    instance_type = var.instance_type 
    key_name = var.key_name 
    user_data = var.user_data
    update_default_version = true 
    vpc_security_group_ids = var.security_group_id
}