resource "aws_route53_zone" "myapp" {
  name = "myapp.com"
}

resource "aws_route53_record" "db_subdomain" {
  zone_id = aws_route53_zone.myapp.zone_id
  name    = "develop${var.subdomain}.myapp.com"
  type    = "A"
  ttl     = 300

  records = [module.db.db_instance_address]
}
