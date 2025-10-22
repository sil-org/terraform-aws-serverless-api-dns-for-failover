
module "primary_region" {
  source = "./modules/certificate-and-domain"

  api_name              = var.api_name
  api_stage             = var.api_stage
  certificate_subdomain = var.certificate_subdomain
  cloudflare_zone_name  = var.cloudflare_zone_name

  providers = { aws = aws }
}

module "secondary_region" {
  source     = "./modules/certificate-and-domain"
  depends_on = [module.primary_region]

  api_name              = var.api_name
  api_stage             = var.api_stage
  certificate_subdomain = var.certificate_subdomain
  cloudflare_zone_name  = var.cloudflare_zone_name

  # Don't create another DNS record, since it's the same for both regions.
  create_dns_validation = false

  providers = { aws = aws.secondary }
}
