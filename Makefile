.PHONY: help init plan apply destroy fmt validate clean deploy

# Default environment
ENV ?= dev

# Colors for output
BLUE := \033[0;34m
GREEN := \033[0;32m
YELLOW := \033[0;33m
RED := \033[0;31m
NC := \033[0m # No Color

help: ## Show this help message
	@echo "$(BLUE)PaulKiat.io Infrastructure Management$(NC)"
	@echo ""
	@echo "$(GREEN)Available targets:$(NC)"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "  $(YELLOW)%-15s$(NC) %s\n", $$1, $$2}'
	@echo ""
	@echo "$(GREEN)Usage:$(NC)"
	@echo "  make <target> ENV=<environment>"
	@echo ""
	@echo "$(GREEN)Examples:$(NC)"
	@echo "  make plan ENV=dev"
	@echo "  make apply ENV=prod"
	@echo "  make deploy ENV=staging"

init: ## Initialize Terraform
	@echo "$(BLUE)Initializing Terraform...$(NC)"
	cd terraform && terraform init

plan: ## Run terraform plan
	@echo "$(BLUE)Planning infrastructure for $(ENV) environment...$(NC)"
	cd terraform && terraform plan -var-file=environments/$(ENV)/terraform.tfvars

apply: ## Apply terraform changes
	@echo "$(BLUE)Applying infrastructure for $(ENV) environment...$(NC)"
	cd terraform && terraform apply -var-file=environments/$(ENV)/terraform.tfvars

apply-auto: ## Apply terraform changes without confirmation
	@echo "$(BLUE)Applying infrastructure for $(ENV) environment (auto-approve)...$(NC)"
	cd terraform && terraform apply -auto-approve -var-file=environments/$(ENV)/terraform.tfvars

destroy: ## Destroy infrastructure
	@echo "$(RED)Destroying infrastructure for $(ENV) environment...$(NC)"
	@echo "$(RED)This will DELETE all resources!$(NC)"
	cd terraform && terraform destroy -var-file=environments/$(ENV)/terraform.tfvars

fmt: ## Format terraform files
	@echo "$(BLUE)Formatting Terraform files...$(NC)"
	cd terraform && terraform fmt -recursive

validate: ## Validate terraform configuration
	@echo "$(BLUE)Validating Terraform configuration...$(NC)"
	cd terraform && terraform validate

output: ## Show terraform outputs
	@echo "$(BLUE)Terraform outputs for $(ENV) environment:$(NC)"
	cd terraform && terraform output

clean: ## Clean terraform cache
	@echo "$(BLUE)Cleaning Terraform cache...$(NC)"
	find terraform -type d -name ".terraform" -exec rm -rf {} + 2>/dev/null || true
	find terraform -type f -name "*.tfstate" -o -name "*.tfstate.backup" -exec rm -f {} + 2>/dev/null || true

deploy: ## Deploy website to S3
	@echo "$(BLUE)Deploying website to $(ENV) environment...$(NC)"
	@BUCKET_NAME=$$(cd terraform && terraform output -raw website_bucket_name 2>/dev/null); \
	if [ -z "$$BUCKET_NAME" ]; then \
		echo "$(RED)Error: Cannot get bucket name. Has infrastructure been applied?$(NC)"; \
		exit 1; \
	fi; \
	echo "$(GREEN)Uploading to S3 bucket: $$BUCKET_NAME$(NC)"; \
	aws s3 sync src/adapters/primary/web/ s3://$$BUCKET_NAME/ --delete --cache-control "public, max-age=3600"

invalidate: ## Invalidate CloudFront cache
	@echo "$(BLUE)Invalidating CloudFront cache for $(ENV) environment...$(NC)"
	@DIST_ID=$$(cd terraform && terraform output -raw cloudfront_distribution_id 2>/dev/null); \
	if [ -z "$$DIST_ID" ]; then \
		echo "$(RED)Error: Cannot get distribution ID. Has infrastructure been applied?$(NC)"; \
		exit 1; \
	fi; \
	echo "$(GREEN)Invalidating distribution: $$DIST_ID$(NC)"; \
	aws cloudfront create-invalidation --distribution-id $$DIST_ID --paths "/*"

deploy-all: deploy invalidate ## Deploy website and invalidate cache
	@echo "$(GREEN)Deployment complete!$(NC)"

logs: ## View CloudWatch logs
	@echo "$(BLUE)Viewing CloudWatch logs for $(ENV) environment...$(NC)"
	@LOG_GROUP=$$(cd terraform && terraform output -raw cloudwatch_log_group_name 2>/dev/null); \
	if [ -z "$$LOG_GROUP" ]; then \
		echo "$(RED)Error: Cannot get log group name. Has infrastructure been applied?$(NC)"; \
		exit 1; \
	fi; \
	echo "$(GREEN)Tailing logs from: $$LOG_GROUP$(NC)"; \
	aws logs tail $$LOG_GROUP --follow

check: fmt validate ## Format and validate terraform
	@echo "$(GREEN)Terraform check complete!$(NC)"

setup-backend: ## Setup remote state backend (run once)
	@echo "$(BLUE)Setting up Terraform remote state backend...$(NC)"
	@read -p "Enter AWS region [us-east-1]: " region; \
	region=$${region:-us-east-1}; \
	bucket="paulkiat-terraform-state"; \
	echo "Creating S3 bucket: $$bucket"; \
	aws s3 mb s3://$$bucket --region $$region || true; \
	aws s3api put-bucket-versioning --bucket $$bucket --versioning-configuration Status=Enabled; \
	aws s3api put-bucket-encryption --bucket $$bucket --server-side-encryption-configuration '{"Rules":[{"ApplyServerSideEncryptionByDefault":{"SSEAlgorithm":"AES256"}}]}'; \
	echo "Creating DynamoDB table: terraform-state-lock"; \
	aws dynamodb create-table --table-name terraform-state-lock --attribute-definitions AttributeName=LockID,AttributeType=S --key-schema AttributeName=LockID,KeyType=HASH --billing-mode PAY_PER_REQUEST --region $$region || true; \
	echo "$(GREEN)Backend setup complete!$(NC)"; \
	echo "$(YELLOW)Uncomment the backend configuration in terraform/main.tf$(NC)"

dashboard: ## Open CloudWatch dashboard
	@echo "$(BLUE)Opening CloudWatch dashboard for $(ENV) environment...$(NC)"
	@DASHBOARD=$$(aws cloudwatch list-dashboards --query 'DashboardEntries[?contains(DashboardName, `paulkiat-$(ENV)`)].DashboardName' --output text); \
	if [ -z "$$DASHBOARD" ]; then \
		echo "$(RED)Error: Dashboard not found for $(ENV) environment$(NC)"; \
		exit 1; \
	fi; \
	echo "$(GREEN)Dashboard: https://console.aws.amazon.com/cloudwatch/home?region=us-east-1#dashboards:name=$$DASHBOARD$(NC)"

info: ## Show infrastructure information
	@echo "$(BLUE)Infrastructure Information for $(ENV) environment:$(NC)"
	@cd terraform && \
	echo "$(GREEN)Website Bucket:$(NC)       $$(terraform output -raw website_bucket_name 2>/dev/null || echo 'Not deployed')" && \
	echo "$(GREEN)CloudFront URL:$(NC)       https://$$(terraform output -raw cloudfront_domain_name 2>/dev/null || echo 'Not deployed')" && \
	echo "$(GREEN)Distribution ID:$(NC)      $$(terraform output -raw cloudfront_distribution_id 2>/dev/null || echo 'Not deployed')" && \
	echo "$(GREEN)Log Group:$(NC)            $$(terraform output -raw cloudwatch_log_group_name 2>/dev/null || echo 'Not deployed')"

cost: ## Estimate infrastructure cost
	@echo "$(BLUE)Infrastructure cost estimation:$(NC)"
	@echo "$(YELLOW)S3 Storage:$(NC)        ~\$$0.50/month (assuming small site)"
	@echo "$(YELLOW)CloudFront:$(NC)        ~\$$5-10/month (depending on traffic)"
	@echo "$(YELLOW)CloudWatch:$(NC)        ~\$$2-5/month (logs and metrics)"
	@echo "$(YELLOW)Route53:$(NC)           ~\$$0.50/month (if using custom domain)"
	@echo "$(GREEN)Total estimate:$(NC)    ~\$$8-16/month for low traffic"

.DEFAULT_GOAL := help
