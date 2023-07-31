
locals {
  primary_region_summary   = "${var.aws_region}: ${var.primary_api_gateway_domain}"
  secondary_region_summary = "${var.aws_region_secondary}: ${var.secondary_api_gateway_domain}"
}

data "cloudflare_zone" "this" {
  name = var.cloudflare_zone_name
}

resource "cloudflare_record" "public_cname" {
  comment = "For easy fail over. ${local.primary_region_summary} / ${local.secondary_region_summary}"
  name    = var.subdomain
  proxied = var.cloudflare_proxy_status
  ttl     = 1 # ttl must be set to 1 when proxied is true
  type    = "CNAME"
  value   = var.primary_api_gateway_domain
  zone_id = data.cloudflare_zone.this.id
}
