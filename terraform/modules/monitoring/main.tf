# Monitoring Module - CloudWatch Configuration
# Following hexagonal architecture: this is an observability adapter

resource "aws_cloudwatch_log_group" "website" {
  name              = "/aws/website/${var.project_name}/${var.environment}"
  retention_in_days = var.log_retention_days

  tags = {
    Name        = "${var.project_name}-${var.environment}-logs"
    Environment = var.environment
  }
}

# CloudWatch Log Stream for Application Logs
resource "aws_cloudwatch_log_stream" "application" {
  name           = "application"
  log_group_name = aws_cloudwatch_log_group.website.name
}

# CloudWatch Log Stream for Deployment Logs
resource "aws_cloudwatch_log_stream" "deployment" {
  name           = "deployment"
  log_group_name = aws_cloudwatch_log_group.website.name
}

# S3 Bucket for CloudFront and other AWS service logs
resource "aws_s3_bucket" "logs" {
  bucket = "${var.project_name}-${var.environment}-logs"

  tags = {
    Name        = "${var.project_name}-${var.environment}-logs"
    Purpose     = "Logs Storage"
    Environment = var.environment
  }
}

resource "aws_s3_bucket_public_access_block" "logs" {
  bucket = aws_s3_bucket.logs.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_lifecycle_configuration" "logs" {
  bucket = aws_s3_bucket.logs.id

  rule {
    id     = "expire-old-logs"
    status = "Enabled"

    expiration {
      days = var.log_retention_days
    }
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "logs" {
  bucket = aws_s3_bucket.logs.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

# CloudWatch Dashboard for monitoring
resource "aws_cloudwatch_dashboard" "website" {
  dashboard_name = "${var.project_name}-${var.environment}-dashboard"

  dashboard_body = jsonencode({
    widgets = [
      {
        type = "metric"
        properties = {
          metrics = [
            ["AWS/CloudFront", "Requests", { stat = "Sum" }],
            [".", "BytesDownloaded", { stat = "Sum" }],
            [".", "4xxErrorRate", { stat = "Average" }],
            [".", "5xxErrorRate", { stat = "Average" }]
          ]
          period = 300
          stat   = "Average"
          region = var.aws_region
          title  = "CloudFront Metrics"
        }
      },
      {
        type = "log"
        properties = {
          query   = "SOURCE '${aws_cloudwatch_log_group.website.name}' | fields @timestamp, @message | sort @timestamp desc | limit 100"
          region  = var.aws_region
          title   = "Recent Logs"
        }
      }
    ]
  })
}

# CloudWatch Alarms for monitoring
resource "aws_cloudwatch_metric_alarm" "high_4xx_error_rate" {
  count               = var.enable_alarms ? 1 : 0
  alarm_name          = "${var.project_name}-${var.environment}-high-4xx-error-rate"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = "2"
  metric_name         = "4xxErrorRate"
  namespace           = "AWS/CloudFront"
  period              = "300"
  statistic           = "Average"
  threshold           = "5"
  alarm_description   = "This metric monitors CloudFront 4xx error rate"
  treat_missing_data  = "notBreaching"

  dimensions = {
    DistributionId = var.cloudfront_distribution_id
  }
}

resource "aws_cloudwatch_metric_alarm" "high_5xx_error_rate" {
  count               = var.enable_alarms ? 1 : 0
  alarm_name          = "${var.project_name}-${var.environment}-high-5xx-error-rate"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = "2"
  metric_name         = "5xxErrorRate"
  namespace           = "AWS/CloudFront"
  period              = "300"
  statistic           = "Average"
  threshold           = "1"
  alarm_description   = "This metric monitors CloudFront 5xx error rate"
  treat_missing_data  = "notBreaching"

  dimensions = {
    DistributionId = var.cloudfront_distribution_id
  }
}
