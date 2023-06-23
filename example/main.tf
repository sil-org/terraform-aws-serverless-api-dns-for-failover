
module "dns_for_failover" {
  source = "github.com/silinternational/terraform-aws-serverless-api-dns-for-failover?ref=0.1.0"

  app_name             = var.app_name
  cloudflare_zone_name = var.cloudflare_zone_name
  serverless_stage     = var.serverless_stage

  providers = {
    aws           = aws
    aws.secondary = aws.secondary
  }
}
