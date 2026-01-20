
provider "aws" {
  region = var.aws_region
}

provider "aws" {
  region = var.aws_region_secondary

  alias = "secondary"
}

provider "cloudflare" {
  api_token = var.cloudflare_token
}
