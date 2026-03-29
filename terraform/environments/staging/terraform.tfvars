# Staging Environment Configuration
# This configuration is for the staging environment

aws_region          = "us-east-1"
environment         = "staging"
project_name        = "paulkiat-website"
domain_name         = ""  # Leave empty for CloudFront-only, or set to "staging.paulkiat.io"
enable_cloudwatch_logs = true
enable_waf          = false
log_retention_days  = 14  # Medium retention for staging
