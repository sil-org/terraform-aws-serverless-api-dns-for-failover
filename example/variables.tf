
variable "app_name" {
  description = "Short name for the app (e.g. 'my-api'). Used as the subdomain."
  type        = string
}

variable "aws_access_key_id" {
  description = "AWS Access Key ID, used for calls to both AWS regions"
  type        = string
  default     = null
}

variable "aws_secret_access_key" {
  description = "AWS Secret Access Key, used for calls to both AWS regions"
  type        = string
  default     = null
}

variable "aws_region" {
  description = "Primary AWS region where you run your Serverless API (e.g. us-east-2)"
  type        = string
}

variable "aws_region_secondary" {
  description = "Secondary AWS region where you run your Serverless API (e.g. us-west-2)"
  type        = string
}

variable "cloudflare_token" {
  description = "Cloudflare limited access API token"
  type        = string
}

variable "cloudflare_zone_name" {
  description = "Cloudflare zone (aka domain) name"
  type        = string
}

variable "serverless_stage" {
  description = "Short name for the stage (aka environment): 'dev' or 'prod'"
  type        = string
}
