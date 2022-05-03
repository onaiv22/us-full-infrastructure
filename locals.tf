locals {
    default_tags = {
        Project = "full-Infrastructure"
        Environment = var.environment
        provisioner = "Terraform"
    }
    name_prefix = "${lower(local.default_tags["Project"])}-${lower(local.default_tags["Environment"])}"
}