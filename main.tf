
locals {
  aws_region           = data.aws_region.primary.name
  aws_region_secondary = data.aws_region.secondary.name
}

data "aws_region" "primary" {}

data "aws_region" "secondary" {
  provider = aws.secondary
}

module "custom-domains" {
  source = "./modules/custom-domains"

  # NOTE: This value needs to match the name given to the API by Serverless.
  api_name = "${var.serverless_stage}-${var.app_name}"

  api_stage             = var.serverless_stage
  certificate_subdomain = var.app_name
  cloudflare_zone_name  = var.cloudflare_zone_name

  providers = {
    aws           = aws
    aws.secondary = aws.secondary
  }
}

module "fail-over-cname" {
  source = "./modules/fail-over-cname"

  aws_region                   = local.aws_region
  aws_region_secondary         = local.aws_region_secondary
  cloudflare_zone_name         = var.cloudflare_zone_name
  primary_region_domain_name   = module.custom-domains.primary_region_domain_name
  secondary_region_domain_name = module.custom-domains.secondary_region_domain_name
  subdomain                    = var.app_name
}
