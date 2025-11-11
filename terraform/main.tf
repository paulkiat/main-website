terraform {
  required_version = ">= 1.0"
  
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  # Backend configuration for remote state
  # Uncomment and configure after creating the S3 bucket for state
  # backend "s3" {
  #   bucket         = "paulkiat-terraform-state"
  #   key            = "main-website/terraform.tfstate"
  #   region         = "us-east-1"
  #   encrypt        = true
  #   dynamodb_table = "terraform-state-lock"
  # }
}

provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      Project     = "PaulKiat.io"
      ManagedBy   = "Terraform"
      Environment = var.environment
    }
  }
}

# Monitoring Module - Must be created first for logs bucket
module "monitoring" {
  source = "./modules/monitoring"

  project_name               = var.project_name
  environment                = var.environment
  aws_region                 = var.aws_region
  log_retention_days         = var.log_retention_days
  enable_alarms              = false # Will be enabled after CloudFront is created
  cloudfront_distribution_id = ""    # Will be updated after CloudFront is created
}

# Storage Module - S3 bucket for website content
module "storage" {
  source = "./modules/storage"

  project_name                 = var.project_name
  environment                  = var.environment
  cloudfront_distribution_arn  = module.networking.cloudfront_distribution_arn
}

# Networking Module - CloudFront CDN
module "networking" {
  source = "./modules/networking"

  project_name                  = var.project_name
  environment                   = var.environment
  bucket_name                   = module.storage.bucket_name
  bucket_regional_domain_name   = module.storage.bucket_regional_domain_name
  domain_name                   = var.domain_name
  logs_bucket_domain_name       = module.monitoring.logs_bucket_domain_name
}

# Compute Module - IAM roles for deployment
module "compute" {
  source = "./modules/compute"

  project_name                = var.project_name
  environment                 = var.environment
  bucket_arn                  = module.storage.bucket_arn
  cloudfront_distribution_arn = module.networking.cloudfront_distribution_arn
  log_group_arn               = module.monitoring.log_group_arn
}
