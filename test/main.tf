
module "test" {
  source = "../"

  api_name             = "my-api-dev"
  cloudflare_zone_name = "example.com"
  serverless_stage     = "dev"
  subdomain            = "my-api"

  providers = {
    aws           = aws
    aws.secondary = aws.secondary
  }
}

provider "aws" {
  region = "us-east-2"
}

provider "aws" {
  region = "us-west-2"
  alias  = "secondary"
}

terraform {
  required_version = ">= 1.0"

  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
    cloudflare = {
      source = "cloudflare/cloudflare"
    }
  }
}
