// Core Domain Interface - Storage Port
// This defines the contract for storage operations without any implementation details

export interface StoragePort {
  /**
   * Store content at the specified key
   */
  save(key: string, content: string, metadata?: Record<string, string>): Promise<void>;

  /**
   * Retrieve content by key
   */
  get(key: string): Promise<string | null>;

  /**
   * Delete content at the specified key
   */
  delete(key: string): Promise<void>;

  /**
   * List all keys with optional prefix filter
   */
  list(prefix?: string): Promise<string[]>;
}
