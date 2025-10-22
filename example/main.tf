
module "dns_for_failover" {
  source  = "sil-org/serverless-api-dns-for-failover/aws"
  version = "~> 0.6.0" # This version number is only an example. Please use the latest version available.

  api_name             = var.api_name
  cloudflare_zone_name = var.cloudflare_zone_name
  serverless_stage     = var.serverless_stage
  subdomain            = var.subdomain

  providers = {
    aws           = aws
    aws.secondary = aws.secondary
  }
}
