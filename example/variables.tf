
variable "api_name" {
  description = "Short name of the API (as shown in AWS API Gateway). It probably consists of your Serverless service name and stage (e.g. either 'my-api-dev' or 'dev-my-api')."
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

variable "cloudflare_proxy_status" {
  description = "Set the Cloudflare CNAME proxy status"
  type        = bool
  default     = true
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

variable "subdomain" {
  description = "The subdomain for the CNAME record (e.g. 'my-api')"
  type        = string
}
