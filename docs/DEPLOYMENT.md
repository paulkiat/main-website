# Deployment Guide

This guide walks you through deploying the PaulKiat.io infrastructure to AWS.

## Prerequisites Checklist

- [ ] AWS account with admin access
- [ ] AWS CLI installed and configured
- [ ] Terraform >= 1.0 installed
- [ ] GitHub repository access
- [ ] Domain name (optional, for custom domain)

## Step 1: AWS OIDC Provider Setup (Recommended)

Set up GitHub Actions OIDC provider for secure, keyless authentication:

```bash
# Create OIDC provider
aws iam create-open-id-connect-provider \
  --url https://token.actions.githubusercontent.com \
  --client-id-list sts.amazonaws.com \
  --thumbprint-list 6938fd4d98bab03faadb97b34396831e3780aea1

# Note the ARN from the output
```

## Step 2: Configure Terraform Backend (Optional but Recommended)

Create S3 bucket and DynamoDB table for remote state:

```bash
# Create S3 bucket for state
aws s3 mb s3://paulkiat-terraform-state --region us-east-1

# Enable versioning
aws s3api put-bucket-versioning \
  --bucket paulkiat-terraform-state \
  --versioning-configuration Status=Enabled

# Enable encryption
aws s3api put-bucket-encryption \
  --bucket paulkiat-terraform-state \
  --server-side-encryption-configuration '{
    "Rules": [{
      "ApplyServerSideEncryptionByDefault": {
        "SSEAlgorithm": "AES256"
      }
    }]
  }'

# Create DynamoDB table for state locking
aws dynamodb create-table \
  --table-name terraform-state-lock \
  --attribute-definitions AttributeName=LockID,AttributeType=S \
  --key-schema AttributeName=LockID,KeyType=HASH \
  --billing-mode PAY_PER_REQUEST \
  --region us-east-1
```

Then uncomment the backend configuration in `terraform/main.tf`.

## Step 3: Deploy Infrastructure

### Development Environment

```bash
cd terraform

# Initialize Terraform
terraform init

# Review the plan
terraform plan -var-file=environments/dev/terraform.tfvars

# Apply changes
terraform apply -var-file=environments/dev/terraform.tfvars

# Note the outputs
terraform output
```

### Production Environment

```bash
cd terraform

# Use production variables
terraform plan -var-file=environments/prod/terraform.tfvars

# Apply
terraform apply -var-file=environments/prod/terraform.tfvars
```

## Step 4: Configure GitHub Actions

### Add Repository Secrets

1. Go to GitHub repository → Settings → Secrets and variables → Actions
2. Add the following secret:
   - `AWS_ROLE_ARN`: The ARN of the IAM role created by Terraform

### Get the Role ARN

```bash
cd terraform
terraform output deployment_role_arn
```

### Set Up Environments (Optional)

1. Go to Settings → Environments
2. Create environments: `dev`, `staging`, `prod`
3. Add protection rules:
   - Require reviewers for production
   - Add deployment branches restriction

## Step 5: Deploy Website

### Manual Deployment

```bash
# Get outputs from Terraform
cd terraform
BUCKET_NAME=$(terraform output -raw website_bucket_name)
DISTRIBUTION_ID=$(terraform output -raw cloudfront_distribution_id)

# Upload website files
aws s3 sync ../src/adapters/primary/web/ s3://$BUCKET_NAME/ \
  --delete \
  --cache-control "public, max-age=3600"

# Invalidate CloudFront cache
aws cloudfront create-invalidation \
  --distribution-id $DISTRIBUTION_ID \
  --paths "/*"
```

### Automatic Deployment via GitHub Actions

Push to main branch:
```bash
git add .
git commit -m "Deploy website"
git push origin main
```

Or trigger manually:
1. Go to Actions tab in GitHub
2. Select "Terraform Apply & Deploy" workflow
3. Click "Run workflow"
4. Select environment and confirm

## Step 6: Verify Deployment

### Check Infrastructure

```bash
# View CloudFront distribution
aws cloudfront get-distribution --id $(terraform output -raw cloudfront_distribution_id)

# Check S3 bucket
aws s3 ls s3://$(terraform output -raw website_bucket_name)/

# View CloudWatch logs
aws logs tail $(terraform output -raw cloudwatch_log_group_name) --follow
```

### Access Website

```bash
# Get CloudFront URL
cd terraform
echo "Website URL: https://$(terraform output -raw cloudfront_domain_name)"
```

Visit the URL in your browser.

### View CloudWatch Dashboard

```bash
# Get dashboard name
DASHBOARD_NAME=$(aws cloudwatch list-dashboards --query 'DashboardEntries[?contains(DashboardName, `paulkiat`)].DashboardName' --output text)

echo "Dashboard: https://console.aws.amazon.com/cloudwatch/home?region=us-east-1#dashboards:name=$DASHBOARD_NAME"
```

## Step 7: Custom Domain Setup (Optional)

### If you have a domain (e.g., paulkiat.io):

1. **Request ACM Certificate**:
   ```bash
   aws acm request-certificate \
     --domain-name paulkiat.io \
     --subject-alternative-names "www.paulkiat.io" \
     --validation-method DNS \
     --region us-east-1
   ```

2. **Validate Certificate**:
   - Follow DNS validation instructions from ACM console
   - Wait for certificate to be issued

3. **Update Terraform Variables**:
   ```hcl
   # In terraform/environments/prod/terraform.tfvars
   domain_name = "paulkiat.io"
   ```

4. **Apply Terraform**:
   ```bash
   terraform apply -var-file=environments/prod/terraform.tfvars
   ```

5. **Update DNS**:
   - Create A record in Route53 or your DNS provider
   - Point to CloudFront distribution
   - Use alias record if using Route53

## Troubleshooting

### Terraform State Locked

```bash
# If state is locked, force unlock (use with caution)
terraform force-unlock <lock-id>
```

### CloudFront Not Serving Latest Content

```bash
# Invalidate cache
aws cloudfront create-invalidation \
  --distribution-id $(terraform output -raw cloudfront_distribution_id) \
  --paths "/*"
```

### GitHub Actions Failing

1. Check AWS credentials are configured correctly
2. Verify IAM role has necessary permissions
3. Check CloudWatch logs for details:
   ```bash
   aws logs tail /aws/website/paulkiat-website/dev --follow
   ```

### S3 Access Denied

Ensure CloudFront OAC is properly configured and S3 bucket policy allows CloudFront access.

## Monitoring

### View Logs

```bash
# Application logs
aws logs tail /aws/website/paulkiat-website/dev --follow

# Deployment logs
aws logs tail /aws/website/paulkiat-website/dev --log-stream-name deployment --follow

# CloudFront access logs
aws s3 ls s3://paulkiat-website-dev-logs/cloudfront/
```

### Check Metrics

Access CloudWatch console or use CLI:
```bash
aws cloudwatch get-metric-statistics \
  --namespace AWS/CloudFront \
  --metric-name Requests \
  --dimensions Name=DistributionId,Value=$(terraform output -raw cloudfront_distribution_id) \
  --start-time $(date -u -d '1 hour ago' +%Y-%m-%dT%H:%M:%S) \
  --end-time $(date -u +%Y-%m-%dT%H:%M:%S) \
  --period 3600 \
  --statistics Sum
```

## Cleanup

To destroy all infrastructure:

```bash
cd terraform

# Review what will be destroyed
terraform plan -destroy -var-file=environments/dev/terraform.tfvars

# Destroy infrastructure
terraform destroy -var-file=environments/dev/terraform.tfvars
```

**Warning**: This will delete all resources including S3 buckets and their contents!

## Cost Estimation

Approximate monthly costs for dev environment:
- S3 Storage: $0.023/GB (~$0.50 for small site)
- CloudFront: $0.085/GB + $0.01 per 10,000 requests (~$5-10)
- CloudWatch: $0.50/GB ingested + $0.03/GB stored (~$2-5)
- Route53 (if used): $0.50/hosted zone + $0.40/million queries

**Total estimated**: $8-16/month for low traffic

Production environment may cost more depending on traffic and enabled features.

## Next Steps

1. [ ] Set up custom domain
2. [ ] Configure monitoring alerts
3. [ ] Add WAF rules for production
4. [ ] Implement backup strategy
5. [ ] Set up staging environment
6. [ ] Configure CI/CD for automated deployments
7. [ ] Add application code
8. [ ] Set up error tracking
9. [ ] Implement analytics

## Support

For issues:
1. Check CloudWatch logs
2. Review GitHub Actions logs
3. Consult [Terraform documentation](https://www.terraform.io/docs)
4. Open GitHub issue with details
