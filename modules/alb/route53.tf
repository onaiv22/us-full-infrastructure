resource "aws_route53_record" "www" {
    zone_id = data.aws_route53_zone.selected.zone_id
    name    = "www.${data.aws_route53_zone.selected.name}"
    type = "CNAME"
    
    alias {
        name = aws_lb.main.dns_name
        zone_id = aws_lb.main.zone_id
        evaluate_target_health = false
    }
}