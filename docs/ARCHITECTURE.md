# System Architecture

This document describes the complete system architecture of PaulKiat.io.

## High-Level Architecture

```
┌─────────────────────────────────────────────────────────────────┐
│                         USERS / INTERNET                         │
└───────────────────────────┬─────────────────────────────────────┘
                            │
                            │ HTTPS
                            ▼
┌─────────────────────────────────────────────────────────────────┐
│                      CloudFront CDN                              │
│  ┌──────────────────────────────────────────────────────────┐  │
│  │  • Global Edge Locations                                  │  │
│  │  • HTTPS Enforcement                                       │  │
│  │  • Origin Access Control (OAC)                            │  │
│  │  • Custom Error Pages                                      │  │
│  └──────────────────────────────────────────────────────────┘  │
└───────────────────────────┬─────────────────────────────────────┘
                            │
                            │ S3 Origin
                            ▼
┌─────────────────────────────────────────────────────────────────┐
│                      S3 Static Website                           │
│  ┌──────────────────────────────────────────────────────────┐  │
│  │  • Static Content Storage                                 │  │
│  │  • Versioning Enabled                                     │  │
│  │  • Server-Side Encryption                                 │  │
│  │  • Private Access (via CloudFront only)                   │  │
│  └──────────────────────────────────────────────────────────┘  │
└─────────────────────────────────────────────────────────────────┘

                            │
                            │ Logs & Metrics
                            ▼
┌─────────────────────────────────────────────────────────────────┐
│                      CloudWatch                                  │
│  ┌──────────────────────────────────────────────────────────┐  │
│  │  • Log Groups & Streams                                   │  │
│  │  • Custom Metrics                                         │  │
│  │  • Dashboards                                             │  │
│  │  • Alarms (4xx/5xx errors)                               │  │
│  └──────────────────────────────────────────────────────────┘  │
└─────────────────────────────────────────────────────────────────┘
```

## Hexagonal Architecture

```
                    ┌──────────────────────────────┐
                    │   PRIMARY ADAPTERS           │
                    │   (Inbound)                  │
                    ├──────────────────────────────┤
                    │  • Web Interface (HTML/CSS) │
                    │  • REST API (Future)        │
                    │  • GraphQL API (Future)     │
                    │  • CLI Tools (Future)       │
                    └──────────┬───────────────────┘
                               │
                               │ Uses
                               ▼
            ┌──────────────────────────────────────────┐
            │         APPLICATION CORE                  │
            │                                           │
            │  ┌────────────────────────────────────┐  │
            │  │         DOMAIN LAYER               │  │
            │  │  • Business Logic                  │  │
            │  │  • Domain Models                   │  │
            │  │  • Value Objects                   │  │
            │  │  • Domain Services                 │  │
            │  └────────────────────────────────────┘  │
            │                                           │
            │  ┌────────────────────────────────────┐  │
            │  │         PORTS LAYER                │  │
            │  │  • StoragePort                     │  │
            │  │  • LoggerPort                      │  │
            │  │  • NotificationPort (Future)       │  │
            │  │  • CachePort (Future)              │  │
            │  └────────────────────────────────────┘  │
            └──────────┬───────────────────────────────┘
                       │
                       │ Implements
                       ▼
    ┌──────────────────────────────────────────────────┐
    │         SECONDARY ADAPTERS                        │
    │         (Outbound)                                │
    ├──────────────────────────────────────────────────┤
    │  AWS Adapters:                                    │
    │  • S3StorageAdapter                              │
    │  • CloudWatchLoggerAdapter                       │
    │  • DynamoDBAdapter (Future)                      │
    │  • SQSAdapter (Future)                           │
    │                                                   │
    │  Storage Adapters:                               │
    │  • LocalStorageAdapter                           │
    │  • RedisAdapter (Future)                         │
    └──────────────────────────────────────────────────┘
```

## Infrastructure as Code (Terraform)

```
┌─────────────────────────────────────────────────────────────┐
│                    TERRAFORM MODULES                         │
└─────────────────────────────────────────────────────────────┘

    ┌─────────────────┐      ┌─────────────────┐
    │   STORAGE       │      │   NETWORKING    │
    │   MODULE        │      │   MODULE        │
    ├─────────────────┤      ├─────────────────┤
    │ • S3 Bucket     │      │ • CloudFront    │
    │ • Versioning    │      │ • OAC           │
    │ • Encryption    │      │ • Cache Policy  │
    │ • Lifecycle     │      │ • SSL/TLS       │
    └─────────────────┘      └─────────────────┘

    ┌─────────────────┐      ┌─────────────────┐
    │   MONITORING    │      │   COMPUTE       │
    │   MODULE        │      │   MODULE        │
    ├─────────────────┤      ├─────────────────┤
    │ • CloudWatch    │      │ • IAM Roles     │
    │ • Log Groups    │      │ • Policies      │
    │ • Dashboards    │      │ • OIDC Provider │
    │ • Alarms        │      │ • Permissions   │
    └─────────────────┘      └─────────────────┘
```

## CI/CD Pipeline

```
┌─────────────────────────────────────────────────────────────┐
│                    GITHUB ACTIONS                            │
└─────────────────────────────────────────────────────────────┘

    ┌─────────────────────────────────────────────────┐
    │  PULL REQUEST WORKFLOW                          │
    ├─────────────────────────────────────────────────┤
    │  1. Checkout Code                               │
    │  2. Setup Terraform                             │
    │  3. Terraform Format Check                      │
    │  4. Terraform Validate                          │
    │  5. Terraform Plan                              │
    │  6. Comment Plan on PR                          │
    └─────────────────────────────────────────────────┘

    ┌─────────────────────────────────────────────────┐
    │  MAIN BRANCH WORKFLOW (Deploy)                  │
    ├─────────────────────────────────────────────────┤
    │  1. Checkout Code                               │
    │  2. Configure AWS Credentials (OIDC)            │
    │  3. Terraform Init                              │
    │  4. Terraform Apply                             │
    │  5. Get Infrastructure Outputs                  │
    │  6. Sync Website to S3                          │
    │  7. Invalidate CloudFront Cache                 │
    │  8. Log to CloudWatch                           │
    │  9. Create Deployment Summary                   │
    └─────────────────────────────────────────────────┘
```

## Data Flow

```
1. User Request Flow:
   User → CloudFront → S3 Bucket → CloudFront → User

2. Deployment Flow:
   Developer → Git Push → GitHub Actions → AWS IAM (OIDC)
   → Terraform Apply → S3 Upload → CloudFront Invalidation
   → CloudWatch Logging

3. Monitoring Flow:
   CloudFront → CloudWatch Metrics
   Application → CloudWatch Logs
   Terraform → CloudWatch Log Events
   
4. Alert Flow:
   CloudWatch Metrics → Alarms → SNS (Future) → Email/Slack
```

## Security Architecture

```
┌─────────────────────────────────────────────────────────────┐
│                    SECURITY LAYERS                           │
└─────────────────────────────────────────────────────────────┘

    Layer 1: Network Security
    ┌──────────────────────────────────────────┐
    │  • HTTPS Only (TLS 1.2+)                 │
    │  • CloudFront WAF (Optional)             │
    │  • Geo-restrictions (Optional)           │
    └──────────────────────────────────────────┘

    Layer 2: Identity & Access
    ┌──────────────────────────────────────────┐
    │  • IAM Roles (Least Privilege)           │
    │  • OIDC Authentication                    │
    │  • Origin Access Control (OAC)           │
    │  • No Hardcoded Credentials              │
    └──────────────────────────────────────────┘

    Layer 3: Data Security
    ┌──────────────────────────────────────────┐
    │  • S3 Server-Side Encryption             │
    │  • Bucket Versioning                     │
    │  • Private S3 Buckets                    │
    │  • Terraform State Encryption            │
    └──────────────────────────────────────────┘

    Layer 4: Monitoring & Compliance
    ┌──────────────────────────────────────────┐
    │  • CloudWatch Logging                    │
    │  • CloudTrail Audit Logs                 │
    │  • Access Logs                           │
    │  • Security Alarms                       │
    └──────────────────────────────────────────┘
```

## Deployment Environments

```
┌────────────────────────────────────────────────────────┐
│                   DEVELOPMENT (dev)                     │
├────────────────────────────────────────────────────────┤
│  • Fast iteration                                       │
│  • Minimal logging (7 days)                            │
│  • No WAF                                              │
│  • Lower costs                                         │
└────────────────────────────────────────────────────────┘

┌────────────────────────────────────────────────────────┐
│                   STAGING (staging)                     │
├────────────────────────────────────────────────────────┤
│  • Production-like environment                         │
│  • Medium logging (14 days)                            │
│  • Testing ground                                      │
│  • Moderate costs                                      │
└────────────────────────────────────────────────────────┘

┌────────────────────────────────────────────────────────┐
│                   PRODUCTION (prod)                     │
├────────────────────────────────────────────────────────┤
│  • Custom domain (paulkiat.io)                         │
│  • Extended logging (30 days)                          │
│  • WAF enabled                                         │
│  • Full monitoring & alerts                            │
│  • Backup & disaster recovery                          │
└────────────────────────────────────────────────────────┘
```

## Scalability & Performance

```
Current Architecture:
┌────────────────────────────────────────────────────┐
│  Static Website (S3 + CloudFront)                  │
│  • Scales automatically                             │
│  • Global CDN distribution                          │
│  • Low latency worldwide                            │
│  • No server management                             │
└────────────────────────────────────────────────────┘

Future Enhancements:
┌────────────────────────────────────────────────────┐
│  • Lambda@Edge for dynamic content                  │
│  • DynamoDB for data storage                        │
│  • ElastiCache for caching                          │
│  • API Gateway for REST APIs                        │
│  • SQS for async processing                         │
└────────────────────────────────────────────────────┘
```

## Key Design Decisions

1. **Hexagonal Architecture**: Enables easy testing and swapping of implementations
2. **Infrastructure as Code**: Everything version-controlled and reproducible
3. **Serverless**: No server management, scales automatically
4. **Security First**: Encryption, HTTPS, least privilege by default
5. **Observable**: Comprehensive logging and monitoring
6. **Cost-Effective**: Pay only for what you use
7. **Multi-Environment**: Separate dev, staging, and production

## Technology Stack

- **Infrastructure**: Terraform, AWS
- **CDN**: CloudFront
- **Storage**: S3
- **Monitoring**: CloudWatch
- **CI/CD**: GitHub Actions
- **Authentication**: OIDC
- **Frontend**: HTML/CSS/JavaScript (extensible to React, Vue, etc.)
- **Future**: TypeScript, Node.js, Lambda, DynamoDB
