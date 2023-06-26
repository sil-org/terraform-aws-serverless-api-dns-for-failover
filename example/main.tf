
module "dns_for_failover" {
  source = "github.com/silinternational/terraform-aws-serverless-api-dns-for-failover?ref=0.3.0"

  api_name             = var.api_name
  cloudflare_zone_name = var.cloudflare_zone_name
  serverless_stage     = var.serverless_stage
  subdomain            = var.subdomain

  providers = {
    aws           = aws
    aws.secondary = aws.secondary
  }
}
