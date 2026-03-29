# Production Environment Configuration
# This configuration is for the production environment

aws_region          = "us-east-1"
environment         = "prod"
project_name        = "paulkiat-website"
domain_name         = ""  # Leave empty for CloudFront-only, or set to "paulkiat.io"
enable_cloudwatch_logs = true
enable_waf          = true  # Enable WAF for production security
log_retention_days  = 90  # Longer retention for production compliance
