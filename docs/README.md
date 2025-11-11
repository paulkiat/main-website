# PaulKiat.io Infrastructure

This repository contains the infrastructure as code (IaC) and website for PaulKiat.io, following hexagonal architecture principles for maintainability and extensibility.

## Architecture Overview

The project follows **Hexagonal Architecture** (Ports and Adapters):

```
src/
├── core/                    # Business logic (domain)
│   ├── domain/             # Core domain models
│   └── ports/              # Interfaces (ports)
└── adapters/               # External integrations
    ├── primary/            # Inbound adapters (UI, API)
    │   └── web/           # Web frontend
    └── secondary/          # Outbound adapters
        ├── aws/           # AWS service integrations
        └── storage/       # Storage implementations
```

## Infrastructure Components

The infrastructure is built using **Terraform** and includes:

- **S3**: Static website hosting
- **CloudFront**: CDN for global content delivery
- **CloudWatch**: Logging, monitoring, and alerting
- **IAM**: Secure deployment roles and policies
- **Route53**: DNS management (optional)

### Module Structure

```
terraform/
├── main.tf                 # Main configuration
├── variables.tf            # Input variables
├── outputs.tf              # Output values
├── modules/
│   ├── storage/           # S3 bucket configuration
│   ├── networking/        # CloudFront CDN
│   ├── monitoring/        # CloudWatch logs & metrics
│   └── compute/           # IAM roles for deployment
└── environments/
    ├── dev/               # Development environment
    ├── staging/           # Staging environment
    └── prod/              # Production environment
```

## Getting Started

### Prerequisites

- Terraform >= 1.0
- AWS CLI configured with appropriate credentials
- GitHub repository access

### Local Development

1. **Initialize Terraform**:
   ```bash
   cd terraform
   terraform init
   ```

2. **Plan changes**:
   ```bash
   terraform plan -var-file=environments/dev/terraform.tfvars
   ```

3. **Apply changes**:
   ```bash
   terraform apply -var-file=environments/dev/terraform.tfvars
   ```

### GitHub Actions Deployment

The repository includes automated CI/CD workflows:

1. **Terraform Plan** (`terraform-plan.yml`):
   - Runs on pull requests
   - Validates Terraform configuration
   - Generates execution plans

2. **Terraform Apply & Deploy** (`terraform-apply.yml`):
   - Runs on push to main or manual trigger
   - Applies infrastructure changes
   - Deploys website to S3
   - Invalidates CloudFront cache
   - Logs to CloudWatch

### Setting Up GitHub Actions

1. **Configure AWS OIDC Provider** (recommended):
   ```bash
   # Create OIDC provider for GitHub Actions
   aws iam create-open-id-connect-provider \
     --url https://token.actions.githubusercontent.com \
     --client-id-list sts.amazonaws.com \
     --thumbprint-list 6938fd4d98bab03faadb97b34396831e3780aea1
   ```

2. **Add GitHub Secrets**:
   - `AWS_ROLE_ARN`: ARN of the IAM role for GitHub Actions

3. **Configure Environments** (optional):
   - Go to repository Settings > Environments
   - Create environments: `dev`, `staging`, `prod`
   - Add protection rules as needed

## CloudWatch Integration

All deployments and infrastructure changes are automatically logged to CloudWatch:

- **Log Group**: `/aws/website/paulkiat-website/{environment}`
- **Log Streams**:
  - `application`: Application logs
  - `deployment`: Deployment logs

### Viewing Logs

```bash
# View recent deployment logs
aws logs tail /aws/website/paulkiat-website/dev --follow

# View CloudWatch Dashboard
aws cloudwatch get-dashboard \
  --dashboard-name paulkiat-website-dev-dashboard
```

## Monitoring

CloudWatch dashboards and alarms are automatically configured:

- **Metrics Monitored**:
  - CloudFront requests
  - Bytes downloaded
  - 4xx/5xx error rates

- **Alarms**:
  - High 4xx error rate (>5%)
  - High 5xx error rate (>1%)

## Extending the Infrastructure

The hexagonal architecture makes it easy to extend:

### Adding a New AWS Service

1. Create a new module in `terraform/modules/`
2. Define the infrastructure in `main.tf`
3. Add variables in `variables.tf`
4. Export outputs in `outputs.tf`
5. Reference in main `terraform/main.tf`

### Adding a New Environment

1. Create directory: `terraform/environments/{env-name}/`
2. Add `terraform.tfvars` with environment-specific values
3. Update GitHub Actions workflows if needed

### Adding Application Code

1. Add domain logic in `src/core/domain/`
2. Define interfaces in `src/core/ports/`
3. Implement adapters in `src/adapters/`
4. Update deployment workflow to build and deploy

## Security

- All S3 buckets use encryption at rest
- CloudFront enforces HTTPS
- IAM roles follow principle of least privilege
- Terraform state should be stored in encrypted S3 bucket (configure backend)

## Maintenance

### State Management

For production use, configure remote state:

1. Create S3 bucket for state:
   ```bash
   aws s3 mb s3://paulkiat-terraform-state
   ```

2. Create DynamoDB table for locking:
   ```bash
   aws dynamodb create-table \
     --table-name terraform-state-lock \
     --attribute-definitions AttributeName=LockID,AttributeType=S \
     --key-schema AttributeName=LockID,KeyType=HASH \
     --billing-mode PAY_PER_REQUEST
   ```

3. Uncomment backend configuration in `terraform/main.tf`

### Updating Terraform Modules

```bash
cd terraform
terraform init -upgrade
terraform plan
```

## Troubleshooting

### Common Issues

1. **Terraform state lock**:
   ```bash
   terraform force-unlock <lock-id>
   ```

2. **CloudFront cache issues**:
   ```bash
   aws cloudfront create-invalidation \
     --distribution-id <dist-id> \
     --paths "/*"
   ```

3. **View deployment logs**:
   ```bash
   aws logs tail /aws/website/paulkiat-website/dev \
     --log-stream-name deployment --follow
   ```

## Contributing

1. Create a feature branch
2. Make changes
3. Test locally with Terraform plan
4. Submit pull request
5. Review Terraform plan in PR comments
6. Merge after approval

## License

Copyright © 2024 Paul Kiat. All rights reserved.

## Support

For issues or questions, please open a GitHub issue.
