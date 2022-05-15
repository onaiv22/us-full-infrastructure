resource "aws_launch_template" "main" {
    count = var.create_launch_template ? 1 : 0
    name = var.launch_template_name
    description = var.launch_template_description
    image_id = var.image_id 
    instance_type = var.instance_type 
    key_name = var.key_name 
    user_data = var.user_data
    default_version = var.default_version
    update_default_version = true 
}