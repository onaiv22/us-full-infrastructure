data "aws_route53_zone" "selected" {
  name         = "senistone.co.uk"
  private_zone = false
}