resource "aws_launch_template" "main" {
    name = var.launch_template_name
    description = var.launch_template_description
    image_id = var.image_id 
    instance_type = var.instance_type 
    key_name = var.key_name 
    user_data = var.user_data
    update_default_version = true 
    vpc_security_group_ids = [aws_security_group.main.id]
}