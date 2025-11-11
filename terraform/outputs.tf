output "website_bucket_name" {
  description = "Name of the S3 bucket hosting the website"
  value       = module.storage.bucket_name
}

output "website_bucket_domain" {
  description = "Domain name of the S3 bucket"
  value       = module.storage.bucket_domain_name
}

output "cloudfront_distribution_id" {
  description = "ID of the CloudFront distribution"
  value       = module.networking.cloudfront_distribution_id
}

output "cloudfront_domain_name" {
  description = "Domain name of the CloudFront distribution"
  value       = module.networking.cloudfront_domain_name
}

output "cloudwatch_log_group_name" {
  description = "Name of the CloudWatch log group"
  value       = module.monitoring.log_group_name
}

output "deployment_role_arn" {
  description = "ARN of the deployment role"
  value       = module.compute.deployment_role_arn
}
