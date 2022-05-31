variable "vpc_id" {}

variable "name" {
  description = "Name used across the resources created"
  type        = string
}
variable "networks" {
    type = map(any)
}
variable "gw_id" {}
variable "nat_gateways" {
  type    = list(any)
  default = []
}