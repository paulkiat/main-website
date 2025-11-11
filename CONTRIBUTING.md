# Contributing to PaulKiat.io

Thank you for considering contributing to this project! This guide will help you understand the project structure and development workflow.

## Table of Contents

- [Code of Conduct](#code-of-conduct)
- [Getting Started](#getting-started)
- [Project Structure](#project-structure)
- [Development Workflow](#development-workflow)
- [Coding Standards](#coding-standards)
- [Testing](#testing)
- [Submitting Changes](#submitting-changes)

## Code of Conduct

This project follows standard open-source community guidelines:
- Be respectful and inclusive
- Focus on constructive feedback
- Help others learn and grow

## Getting Started

### Prerequisites

- Git
- Terraform >= 1.0
- AWS CLI configured
- Node.js (for TypeScript development)
- Basic understanding of hexagonal architecture

### Initial Setup

1. **Fork and Clone**:
   ```bash
   git clone https://github.com/YOUR_USERNAME/main-website.git
   cd main-website
   ```

2. **Install Dependencies** (if adding application code):
   ```bash
   npm install  # or yarn install
   ```

3. **Configure AWS**:
   ```bash
   aws configure
   ```

## Project Structure

The project follows **Hexagonal Architecture**:

```
main-website/
├── .github/workflows/     # CI/CD pipelines
├── terraform/            # Infrastructure as Code
│   ├── modules/         # Reusable Terraform modules
│   └── environments/    # Environment-specific configs
├── src/
│   ├── core/           # Business logic (no external dependencies)
│   │   ├── domain/     # Domain models
│   │   └── ports/      # Interfaces
│   └── adapters/       # External integrations
│       ├── primary/    # Inbound (UI, API)
│       └── secondary/  # Outbound (AWS, storage)
└── docs/              # Documentation
```

### Key Principles

1. **Domain Independence**: Core domain should never import from adapters
2. **Interface-Driven**: All external interactions through ports
3. **Testability**: Easy to mock and test each layer
4. **Modularity**: Each module has single responsibility

## Development Workflow

### 1. Create a Branch

```bash
git checkout -b feature/your-feature-name
# or
git checkout -b fix/bug-description
```

Branch naming conventions:
- `feature/` - New features
- `fix/` - Bug fixes
- `docs/` - Documentation updates
- `refactor/` - Code refactoring
- `test/` - Adding tests

### 2. Make Changes

Follow the hexagonal architecture pattern:

#### Adding Infrastructure

1. Create or update Terraform modules in `terraform/modules/`
2. Define clear inputs and outputs
3. Document the module in comments
4. Test with `terraform plan`

Example:
```bash
cd terraform
terraform fmt -recursive
terraform validate
terraform plan -var-file=environments/dev/terraform.tfvars
```

#### Adding Application Code

1. **Domain Logic**: Add to `src/core/domain/`
   ```typescript
   // Pure business logic, no dependencies
   export class ContentService {
     // ...
   }
   ```

2. **Ports**: Define interfaces in `src/core/ports/`
   ```typescript
   export interface ContentRepositoryPort {
     save(content: Content): Promise<void>;
   }
   ```

3. **Adapters**: Implement in `src/adapters/`
   ```typescript
   export class S3ContentAdapter implements ContentRepositoryPort {
     // AWS-specific implementation
   }
   ```

### 3. Test Your Changes

```bash
# Format Terraform
terraform fmt -recursive

# Validate Terraform
terraform validate

# Plan infrastructure changes
terraform plan -var-file=environments/dev/terraform.tfvars

# Run tests (if application code)
npm test

# Type check (if TypeScript)
npm run type-check
```

### 4. Commit Changes

Follow conventional commit format:

```bash
git add .
git commit -m "feat: add new CloudWatch alarm for high latency"
# or
git commit -m "fix: correct S3 bucket policy for CloudFront access"
# or
git commit -m "docs: update deployment guide with OIDC setup"
```

Commit message types:
- `feat:` - New feature
- `fix:` - Bug fix
- `docs:` - Documentation changes
- `refactor:` - Code refactoring
- `test:` - Adding tests
- `chore:` - Maintenance tasks
- `ci:` - CI/CD changes

## Coding Standards

### Terraform

- Use consistent formatting: `terraform fmt -recursive`
- Add comments for complex logic
- Use variables for configurable values
- Output important resource attributes
- Follow module best practices:
  ```hcl
  # Good
  variable "environment" {
    description = "Environment name"
    type        = string
  }
  
  # Bad
  variable "env" {
    type = string
  }
  ```

### TypeScript

- Use TypeScript for type safety
- Follow interface-driven design
- Keep domain logic pure (no side effects)
- Use dependency injection
- Example:
  ```typescript
  // Good - Dependency injection
  class ContentService {
    constructor(private repository: ContentRepositoryPort) {}
  }
  
  // Bad - Direct dependency
  class ContentService {
    private repository = new S3Repository();
  }
  ```

### Documentation

- Update README.md for user-facing changes
- Update docs/ for architectural decisions
- Add inline comments for complex logic
- Include examples in documentation

## Testing

### Infrastructure Testing

```bash
# Terraform validation
terraform validate

# Terraform plan (no apply)
terraform plan -var-file=environments/dev/terraform.tfvars

# Check formatting
terraform fmt -check -recursive
```

### Application Testing

```bash
# Run unit tests
npm test

# Run with coverage
npm run test:coverage

# Run integration tests
npm run test:integration
```

### Manual Testing

1. Deploy to dev environment
2. Verify CloudWatch logs
3. Test website functionality
4. Check CloudFront distribution
5. Validate monitoring dashboards

## Submitting Changes

### 1. Push Your Branch

```bash
git push origin feature/your-feature-name
```

### 2. Create Pull Request

1. Go to GitHub repository
2. Click "New Pull Request"
3. Select your branch
4. Fill in the PR template:
   - Description of changes
   - Related issues
   - Testing performed
   - Screenshots (if UI changes)

### 3. PR Review Process

- GitHub Actions will run automatically:
  - Terraform validation
  - Format checking
  - Plan generation
- Address review comments
- Make requested changes
- Re-request review

### 4. Merge

Once approved:
- Squash and merge (for feature branches)
- Create merge commit (for release branches)

## Common Contributions

### Adding a New AWS Service

1. Create module in `terraform/modules/{service-name}/`
2. Add `main.tf`, `variables.tf`, `outputs.tf`
3. Reference in `terraform/main.tf`
4. Create adapter in `src/adapters/secondary/aws/`
5. Define port in `src/core/ports/`
6. Update documentation

### Improving Documentation

1. Identify unclear or missing documentation
2. Add examples and clarifications
3. Update diagrams if needed
4. Ensure consistent formatting
5. Test instructions by following them

### Fixing Bugs

1. Reproduce the bug
2. Create a test that fails
3. Fix the bug
4. Verify test passes
5. Document the fix

### Adding Features

1. Discuss in an issue first
2. Follow hexagonal architecture
3. Add tests
4. Update documentation
5. Submit PR

## Questions?

- Open an issue for discussions
- Check existing documentation
- Review hexagonal architecture guide

## License

By contributing, you agree that your contributions will be licensed under the same license as the project.

Thank you for contributing! 🎉
