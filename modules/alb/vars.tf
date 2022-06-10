#####################################################
# ALB variables
#####################################################
variable "vpc_id" {}

variable "cert" {
  description = "Arn of the certificate"
  type        = string
}
variable "environment" {}

variable "name" {
  description = "Name used across the resources created"
  type        = string
}

variable "enable_deletion_protection" {
  description = "If true, deletion of the load balancer will be disabled via the AWS API. This will prevent Terraform from deleting the load balancer. Defaults to false."
  type        = bool
  default     = false
}

variable "load_balancer_type" {
  description = "The type of load balancer to create. Possible values are application or network."
  type        = string
  default     = "application"
}

variable "internal" {
  description = "Boolean determining if the load balancer is internal or externally facing."
  type        = bool
  default     = false
}

variable "subnets" {
  description = "A list of subnets to associate with the load balancer. e.g. ['subnet-1a2b3c4d','subnet-1a2b3c4e','subnet-1a2b3c4f']"
  type        = list(string)
  default     = null
}



variable "security_groups" {
  description = "The security groups to attach to the load balancer. e.g. [\"sg-edcd9784\",\"sg-edcd9785\"]"
  type        = list(string)
  default     = []
}

variable "ip_address_type" {
  description = "The type of IP addresses used by the subnets for your load balancer. The possible values are ipv4 and dualstack."
  type        = string
  default     = "ipv4"
}




#####################################################
# Target Group Variables
#####################################################

variable "target" {
    type = map(any)
    
    default = {
        name             = "tg"
        port             = "443"
        protocol         = "HTTPS"
        timeout          = 5
        interval         = 3
        healthy_threshold = 3
        matcher          = 200
        type             = "forward"
    }
}

variable "path" {
    type = map(any)

    default = {
        healthcheckpath = "/"
    }
}

