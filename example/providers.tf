
provider "aws" {
  region     = var.aws_region
  access_key = var.aws_access_key_id
  secret_key = var.aws_secret_access_key
}

provider "aws" {
  region     = var.aws_region_secondary
  access_key = var.aws_access_key_id
  secret_key = var.aws_secret_access_key

  alias = "secondary"
}

provider "cloudflare" {
  api_token = var.cloudflare_token
}
