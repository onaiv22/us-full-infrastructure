resource "aws_launch_template" "main" {
    name = "${var.name}-launch-template"
    description = var.launch_template_description
    image_id = var.ami
    instance_type = var.instance_type 
    key_name = var.key_name 
    default_version = var.default_version
    user_data = var.user_data
    update_default_version = true 
    vpc_security_group_ids = [aws_security_group.main.id]
}