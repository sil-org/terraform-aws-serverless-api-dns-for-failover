
module "test" {
  source = "../"

  app_name             = "my-api"
  cloudflare_zone_name = "example.com"
  serverless_stage     = "dev"

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
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = ">= 2.0.0, < 4.0.0"
    }
  }
}
