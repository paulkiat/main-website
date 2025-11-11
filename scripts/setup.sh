#!/bin/bash

# PaulKiat.io Quick Setup Script
# This script helps set up the infrastructure quickly

set -e

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${BLUE}"
echo "╔═══════════════════════════════════════════════════════════╗"
echo "║                                                           ║"
echo "║           PaulKiat.io Infrastructure Setup                ║"
echo "║                                                           ║"
echo "╚═══════════════════════════════════════════════════════════╝"
echo -e "${NC}"

# Check prerequisites
echo -e "${BLUE}Checking prerequisites...${NC}"

command -v terraform >/dev/null 2>&1 || {
    echo -e "${RED}Error: Terraform is not installed.${NC}"
    echo "Please install Terraform from https://www.terraform.io/downloads"
    exit 1
}

command -v aws >/dev/null 2>&1 || {
    echo -e "${RED}Error: AWS CLI is not installed.${NC}"
    echo "Please install AWS CLI from https://aws.amazon.com/cli/"
    exit 1
}

# Check AWS credentials
if ! aws sts get-caller-identity >/dev/null 2>&1; then
    echo -e "${RED}Error: AWS credentials not configured.${NC}"
    echo "Run: aws configure"
    exit 1
fi

echo -e "${GREEN}✓ All prerequisites met${NC}"

# Select environment
echo ""
echo -e "${BLUE}Select environment:${NC}"
echo "1) Development (dev)"
echo "2) Staging (staging)"
echo "3) Production (prod)"
read -p "Enter choice [1-3]: " env_choice

case $env_choice in
    1) ENV="dev" ;;
    2) ENV="staging" ;;
    3) ENV="prod" ;;
    *) echo -e "${RED}Invalid choice${NC}"; exit 1 ;;
esac

echo -e "${GREEN}Selected environment: $ENV${NC}"

# Ask about remote state
echo ""
echo -e "${BLUE}Remote State Backend${NC}"
read -p "Do you want to set up remote state backend? (recommended) [y/N]: " setup_backend

if [[ $setup_backend =~ ^[Yy]$ ]]; then
    echo -e "${BLUE}Setting up remote state backend...${NC}"
    
    read -p "AWS Region [us-east-1]: " region
    region=${region:-us-east-1}
    
    bucket="paulkiat-terraform-state"
    
    echo "Creating S3 bucket: $bucket"
    aws s3 mb s3://$bucket --region $region 2>/dev/null || echo "Bucket already exists"
    
    echo "Enabling versioning..."
    aws s3api put-bucket-versioning \
        --bucket $bucket \
        --versioning-configuration Status=Enabled
    
    echo "Enabling encryption..."
    aws s3api put-bucket-encryption \
        --bucket $bucket \
        --server-side-encryption-configuration '{
            "Rules": [{
                "ApplyServerSideEncryptionByDefault": {
                    "SSEAlgorithm": "AES256"
                }
            }]
        }'
    
    echo "Creating DynamoDB table for state locking..."
    aws dynamodb create-table \
        --table-name terraform-state-lock \
        --attribute-definitions AttributeName=LockID,AttributeType=S \
        --key-schema AttributeName=LockID,KeyType=HASH \
        --billing-mode PAY_PER_REQUEST \
        --region $region 2>/dev/null || echo "Table already exists"
    
    echo -e "${GREEN}✓ Remote backend created${NC}"
    echo -e "${YELLOW}Note: Uncomment the backend configuration in terraform/main.tf${NC}"
fi

# Initialize Terraform
echo ""
echo -e "${BLUE}Initializing Terraform...${NC}"
cd terraform
terraform init

# Run plan
echo ""
echo -e "${BLUE}Running Terraform plan...${NC}"
terraform plan -var-file=environments/$ENV/terraform.tfvars

# Ask to apply
echo ""
read -p "Do you want to apply these changes? [y/N]: " apply_changes

if [[ $apply_changes =~ ^[Yy]$ ]]; then
    echo -e "${BLUE}Applying Terraform changes...${NC}"
    terraform apply -var-file=environments/$ENV/terraform.tfvars
    
    # Get outputs
    echo ""
    echo -e "${GREEN}✓ Infrastructure deployed successfully!${NC}"
    echo ""
    echo -e "${BLUE}Infrastructure Details:${NC}"
    echo -e "${GREEN}Website Bucket:${NC}       $(terraform output -raw website_bucket_name)"
    echo -e "${GREEN}CloudFront URL:${NC}       https://$(terraform output -raw cloudfront_domain_name)"
    echo -e "${GREEN}Distribution ID:${NC}      $(terraform output -raw cloudfront_distribution_id)"
    echo -e "${GREEN}Log Group:${NC}            $(terraform output -raw cloudwatch_log_group_name)"
    
    # Deploy website
    echo ""
    read -p "Do you want to deploy the website now? [y/N]: " deploy_now
    
    if [[ $deploy_now =~ ^[Yy]$ ]]; then
        echo -e "${BLUE}Deploying website...${NC}"
        BUCKET_NAME=$(terraform output -raw website_bucket_name)
        
        cd ..
        aws s3 sync src/adapters/primary/web/ s3://$BUCKET_NAME/ \
            --delete \
            --cache-control "public, max-age=3600"
        
        echo -e "${GREEN}✓ Website deployed${NC}"
        
        # Invalidate CloudFront
        echo -e "${BLUE}Invalidating CloudFront cache...${NC}"
        DIST_ID=$(cd terraform && terraform output -raw cloudfront_distribution_id)
        aws cloudfront create-invalidation \
            --distribution-id $DIST_ID \
            --paths "/*" >/dev/null
        
        echo -e "${GREEN}✓ Cache invalidated${NC}"
        
        echo ""
        echo -e "${GREEN}╔═══════════════════════════════════════════════════════════╗${NC}"
        echo -e "${GREEN}║                                                           ║${NC}"
        echo -e "${GREEN}║                  Setup Complete! 🎉                       ║${NC}"
        echo -e "${GREEN}║                                                           ║${NC}"
        echo -e "${GREEN}╚═══════════════════════════════════════════════════════════╝${NC}"
        echo ""
        echo -e "${BLUE}Your website is available at:${NC}"
        echo -e "${GREEN}https://$(cd terraform && terraform output -raw cloudfront_domain_name)${NC}"
        echo ""
        echo -e "${BLUE}Next steps:${NC}"
        echo "1. Configure custom domain (optional)"
        echo "2. Update website content in src/adapters/primary/web/"
        echo "3. Set up GitHub Actions for automated deployments"
        echo "4. View logs: make logs ENV=$ENV"
        echo ""
        echo -e "${BLUE}Useful commands:${NC}"
        echo "  make help              - Show all available commands"
        echo "  make info ENV=$ENV     - Show infrastructure information"
        echo "  make logs ENV=$ENV     - View CloudWatch logs"
        echo "  make deploy ENV=$ENV   - Deploy website updates"
    fi
else
    echo -e "${YELLOW}Skipped infrastructure deployment${NC}"
    echo "Run 'make apply ENV=$ENV' when ready to deploy"
fi

echo ""
echo -e "${BLUE}Setup script completed!${NC}"
