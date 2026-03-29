# PaulKiat.io

> A personal website built with modern infrastructure practices and hexagonal architecture

[![Terraform](https://img.shields.io/badge/Terraform-1.6+-623CE4?logo=terraform)](https://www.terraform.io/)
[![AWS](https://img.shields.io/badge/AWS-Cloud-FF9900?logo=amazon-aws)](https://aws.amazon.com/)
[![GitHub Actions](https://img.shields.io/badge/CI%2FCD-GitHub%20Actions-2088FF?logo=github-actions)](https://github.com/features/actions)

## 🚀 Overview

PaulKiat.io is a personal website platform designed to be a place for everything Paul Kiat. The infrastructure is built using modern DevOps practices with Infrastructure as Code (IaC) and follows hexagonal architecture principles for maintainability and extensibility.

## ✨ Features

- **Infrastructure as Code**: Complete Terraform configuration for AWS
- **Automated Deployment**: GitHub Actions for CI/CD
- **CloudWatch Integration**: Comprehensive logging and monitoring
- **Hexagonal Architecture**: Clean, maintainable, and testable code structure
- **Multi-Environment Support**: Dev, Staging, and Production configurations
- **Secure by Default**: Encrypted storage, HTTPS-only, least-privilege IAM

## 🏗️ Architecture

This project implements **Hexagonal Architecture** (Ports and Adapters):

```
┌─────────────────────────────────────────────────┐
│                Primary Adapters                  │
│         (Web UI, API, CLI, etc.)                │
└────────────────┬────────────────────────────────┘
                 │
┌────────────────▼────────────────────────────────┐
│              Core Domain                         │
│         (Business Logic & Ports)                │
└────────────────┬────────────────────────────────┘
                 │
┌────────────────▼────────────────────────────────┐
│            Secondary Adapters                    │
│    (AWS Services, Storage, Monitoring)          │
└─────────────────────────────────────────────────┘
```

### Infrastructure Components

- **S3**: Static website hosting with versioning and encryption
- **CloudFront**: Global CDN with HTTPS enforcement
- **CloudWatch**: Logs, metrics, dashboards, and alarms
- **IAM**: Secure roles and policies for GitHub Actions deployment
- **Route53**: DNS management (optional)

## 📁 Project Structure

```
.
├── .github/
│   └── workflows/          # CI/CD pipelines
│       ├── terraform-plan.yml
│       └── terraform-apply.yml
├── terraform/
│   ├── main.tf            # Main Terraform configuration
│   ├── variables.tf       # Input variables
│   ├── outputs.tf         # Output values
│   ├── modules/           # Reusable Terraform modules
│   │   ├── storage/       # S3 configuration
│   │   ├── networking/    # CloudFront CDN
│   │   ├── monitoring/    # CloudWatch setup
│   │   └── compute/       # IAM roles
│   └── environments/      # Environment-specific configs
│       ├── dev/
│       ├── staging/
│       └── prod/
├── src/
│   ├── core/
│   │   ├── domain/        # Business logic
│   │   └── ports/         # Interfaces
│   └── adapters/
│       ├── primary/       # Inbound adapters (UI)
│       └── secondary/     # Outbound adapters (AWS)
└── docs/
    ├── README.md
    └── HEXAGONAL_ARCHITECTURE.md
```

## 🚦 Getting Started

### Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) >= 1.0
- [AWS CLI](https://aws.amazon.com/cli/) configured
- AWS account with appropriate permissions

### Quick Start

1. **Clone the repository**:
   ```bash
   git clone https://github.com/paulkiat/main-website.git
   cd main-website
   ```

2. **Initialize Terraform**:
   ```bash
   cd terraform
   terraform init
   ```

3. **Plan infrastructure changes**:
   ```bash
   terraform plan -var-file=environments/dev/terraform.tfvars
   ```

4. **Apply infrastructure**:
   ```bash
   terraform apply -var-file=environments/dev/terraform.tfvars
   ```

### GitHub Actions Setup

**Quick Setup**: Use automated scripts to configure AWS authentication:

```bash
# Option 1: OIDC (Recommended - Most Secure)
cd scripts
./setup-github-oidc.sh

# Option 2: Access Keys (Quick Testing)
cd scripts
./setup-access-keys.sh
```

**Manual Setup**:
1. **Configure AWS credentials** using OIDC (recommended) or access keys
2. **Add repository secrets**:
   - `AWS_ROLE_ARN`: IAM role ARN for GitHub Actions (OIDC)
   - OR `AWS_ACCESS_KEY_ID` + `AWS_SECRET_ACCESS_KEY` (Access Keys)
3. **Push to main branch** to trigger deployment

See [docs/GITHUB_ACTIONS_SETUP.md](docs/GITHUB_ACTIONS_SETUP.md) for comprehensive setup instructions.

## 📊 Monitoring

All deployments and infrastructure changes are logged to CloudWatch:

```bash
# View deployment logs
aws logs tail /aws/website/paulkiat-website/dev --follow

# Access CloudWatch Dashboard
# Navigate to AWS Console > CloudWatch > Dashboards > paulkiat-website-dev-dashboard
```

## 🛠️ Development

### Local Testing

```bash
# Format Terraform code
terraform fmt -recursive

# Validate configuration
terraform validate

# Run plan
terraform plan -var-file=environments/dev/terraform.tfvars
```

### Adding New Features

1. Define domain model in `src/core/domain/`
2. Create port interfaces in `src/core/ports/`
3. Implement adapters in `src/adapters/`
4. Add infrastructure in `terraform/modules/`

See [HEXAGONAL_ARCHITECTURE.md](docs/HEXAGONAL_ARCHITECTURE.md) for detailed guidance.

## 🔒 Security

- All S3 buckets use server-side encryption
- CloudFront enforces HTTPS
- IAM roles follow least-privilege principle
- Terraform state should be stored in encrypted S3 (configure backend)
- No hardcoded credentials

## 📖 Documentation

- [Infrastructure Guide](docs/README.md)
- [Hexagonal Architecture Guide](docs/HEXAGONAL_ARCHITECTURE.md)

## 🤝 Contributing

1. Create a feature branch
2. Make your changes
3. Test with `terraform plan`
4. Submit a pull request
5. Wait for CI/CD checks to pass

## 📝 License

Copyright © 2024 Paul Kiat. All rights reserved.

## 📧 Contact

For questions or issues, please open a GitHub issue.

---

**Built with** ❤️ **using Terraform, AWS, and GitHub Actions**
