resource "aws_route53_zone" "main" {
    name = var.domain_name
    # provisioner "local-exec" {
    #     command = "echo ${aws_route53_zone.main.name_servers} >> ns.txt "
      
    # }
  
}

resource "aws_route53_record" "www" {
  zone_id = aws_route53_zone.main.zone_id
  name    = var.domain_name
  type    = "A"

  alias {
    name                   = aws_lb.lb.dns_name
    zone_id                = aws_lb.lb.zone_id
    evaluate_target_health = true
  }
}