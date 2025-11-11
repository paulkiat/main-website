variable "project_name" {
  description = "Project name"
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string
}

variable "bucket_arn" {
  description = "ARN of the S3 bucket"
  type        = string
}

variable "cloudfront_distribution_arn" {
  description = "ARN of the CloudFront distribution"
  type        = string
}

variable "log_group_arn" {
  description = "ARN of the CloudWatch log group"
  type        = string
}

variable "github_repo" {
  description = "GitHub repository in format owner/repo"
  type        = string
  default     = "paulkiat/main-website"
}

variable "oidc_provider_arn" {
  description = "ARN of the OIDC provider for GitHub Actions"
  type        = string
  default     = ""
}
