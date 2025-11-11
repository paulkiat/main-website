# Hexagonal Architecture Guide

## Overview

This project implements **Hexagonal Architecture** (also known as Ports and Adapters architecture) to ensure the codebase is:
- **Maintainable**: Clear separation of concerns
- **Testable**: Business logic isolated from infrastructure
- **Extensible**: Easy to add new features or swap implementations

## Core Concepts

### 1. Domain (Business Logic)
Located in `src/core/domain/`, this is the heart of the application containing:
- Business rules
- Domain models
- Core logic

**Key Principle**: Domain should have NO dependencies on external systems.

### 2. Ports (Interfaces)
Located in `src/core/ports/`, ports define contracts for:
- **Primary/Inbound Ports**: How the outside world interacts with our domain
- **Secondary/Outbound Ports**: How our domain interacts with external systems

**Example**:
```typescript
// src/core/ports/storage.port.ts
export interface StoragePort {
  save(key: string, value: any): Promise<void>;
  get(key: string): Promise<any>;
  delete(key: string): Promise<void>;
}
```

### 3. Adapters (Implementations)
Located in `src/adapters/`, adapters implement the ports:

#### Primary Adapters (Inbound)
- Web UI (`adapters/primary/web/`)
- REST APIs
- CLI interfaces
- GraphQL endpoints

#### Secondary Adapters (Outbound)
- AWS services (`adapters/secondary/aws/`)
- Database implementations (`adapters/secondary/storage/`)
- External APIs
- Message queues

**Example**:
```typescript
// src/adapters/secondary/storage/s3-storage.adapter.ts
import { StoragePort } from '@/core/ports/storage.port';
import { S3Client } from '@aws-sdk/client-s3';

export class S3StorageAdapter implements StoragePort {
  constructor(private s3Client: S3Client) {}
  
  async save(key: string, value: any): Promise<void> {
    // S3-specific implementation
  }
  
  async get(key: string): Promise<any> {
    // S3-specific implementation
  }
  
  async delete(key: string): Promise<void> {
    // S3-specific implementation
  }
}
```

## Infrastructure as Code (Terraform)

Our Terraform modules follow hexagonal principles:

```
terraform/modules/
├── storage/        # Data persistence adapter
├── networking/     # Communication adapter
├── monitoring/     # Observability adapter
└── compute/        # Execution environment adapter
```

Each module:
1. **Has clear inputs** (variables.tf) - like a port
2. **Provides outputs** (outputs.tf) - like an interface
3. **Implements infrastructure** (main.tf) - like an adapter

## Benefits

### 1. Testability
```typescript
// Easy to test with mocks
const mockStorage: StoragePort = {
  save: jest.fn(),
  get: jest.fn(),
  delete: jest.fn()
};

const service = new MyDomainService(mockStorage);
```

### 2. Swappable Implementations
```typescript
// Development: Use local storage
const storage = new LocalStorageAdapter();

// Production: Use S3
const storage = new S3StorageAdapter(s3Client);

// Same interface, different implementation
const service = new MyDomainService(storage);
```

### 3. Clear Dependencies
```
Domain (No external dependencies)
   ↑
Ports (Interfaces only)
   ↑
Adapters (External systems)
```

## Directory Structure

```
src/
├── core/
│   ├── domain/
│   │   ├── models/           # Domain entities
│   │   ├── services/         # Business logic
│   │   └── value-objects/    # Immutable values
│   └── ports/
│       ├── primary/          # Inbound interfaces
│       └── secondary/        # Outbound interfaces
└── adapters/
    ├── primary/
    │   ├── web/             # Web UI adapter
    │   ├── api/             # REST API adapter
    │   └── cli/             # CLI adapter
    └── secondary/
        ├── aws/             # AWS service adapters
        │   ├── s3.adapter.ts
        │   ├── cloudwatch.adapter.ts
        │   └── dynamodb.adapter.ts
        └── storage/         # Storage implementations
            ├── local.adapter.ts
            └── redis.adapter.ts
```

## Implementation Guidelines

### 1. Domain Layer
- **DO**: Focus on business logic
- **DON'T**: Import AWS SDK, HTTP libraries, or database drivers
- **Example**: Calculate pricing, validate business rules

### 2. Ports Layer
- **DO**: Define clear interfaces
- **DON'T**: Include implementation details
- **Example**: Define what operations are needed, not how they work

### 3. Adapters Layer
- **DO**: Handle external system specifics
- **DON'T**: Include business logic
- **Example**: AWS API calls, HTTP requests, database queries

## Examples

### Adding a New Feature

1. **Define Domain Model**:
```typescript
// src/core/domain/models/content.model.ts
export class Content {
  constructor(
    public readonly id: string,
    public readonly title: string,
    public readonly body: string
  ) {}
}
```

2. **Define Port**:
```typescript
// src/core/ports/secondary/content-repository.port.ts
export interface ContentRepositoryPort {
  save(content: Content): Promise<void>;
  findById(id: string): Promise<Content | null>;
}
```

3. **Implement Adapter**:
```typescript
// src/adapters/secondary/aws/dynamodb-content-repository.adapter.ts
export class DynamoDBContentRepositoryAdapter implements ContentRepositoryPort {
  async save(content: Content): Promise<void> {
    // DynamoDB implementation
  }
  
  async findById(id: string): Promise<Content | null> {
    // DynamoDB implementation
  }
}
```

4. **Use in Domain Service**:
```typescript
// src/core/domain/services/content.service.ts
export class ContentService {
  constructor(private repository: ContentRepositoryPort) {}
  
  async createContent(title: string, body: string): Promise<Content> {
    const content = new Content(generateId(), title, body);
    await this.repository.save(content);
    return content;
  }
}
```

### Adding New Infrastructure

1. **Create Terraform Module**:
```
terraform/modules/new-service/
├── main.tf
├── variables.tf
└── outputs.tf
```

2. **Add to Main Configuration**:
```hcl
module "new_service" {
  source = "./modules/new-service"
  # variables
}
```

3. **Create Adapter**:
```typescript
// src/adapters/secondary/aws/new-service.adapter.ts
export class NewServiceAdapter implements NewServicePort {
  // Implementation
}
```

## Testing Strategy

### Unit Tests
```typescript
// Test domain logic with mocks
describe('ContentService', () => {
  it('should create content', async () => {
    const mockRepo: ContentRepositoryPort = {
      save: jest.fn(),
      findById: jest.fn()
    };
    
    const service = new ContentService(mockRepo);
    await service.createContent('Title', 'Body');
    
    expect(mockRepo.save).toHaveBeenCalled();
  });
});
```

### Integration Tests
```typescript
// Test with real adapters
describe('S3StorageAdapter', () => {
  it('should store and retrieve data', async () => {
    const adapter = new S3StorageAdapter(s3Client);
    await adapter.save('key', 'value');
    const result = await adapter.get('key');
    expect(result).toBe('value');
  });
});
```

## Migration Path

When adding new features:

1. Start with domain model
2. Define port interfaces
3. Implement adapters
4. Add infrastructure (Terraform)
5. Wire everything together

This ensures business logic is protected and infrastructure can evolve independently.

## Further Reading

- [Alistair Cockburn's Hexagonal Architecture](https://alistair.cockburn.us/hexagonal-architecture/)
- [Clean Architecture by Robert C. Martin](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html)
- [Ports and Adapters Pattern](https://herbertograca.com/2017/09/14/ports-adapters-architecture/)
