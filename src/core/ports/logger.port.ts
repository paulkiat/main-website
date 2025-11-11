// Core Domain Interface - Logger Port
// This defines the contract for logging without any implementation details

export enum LogLevel {
  DEBUG = 'DEBUG',
  INFO = 'INFO',
  WARN = 'WARN',
  ERROR = 'ERROR'
}

export interface LoggerPort {
  /**
   * Log a debug message
   */
  debug(message: string, context?: Record<string, any>): void;

  /**
   * Log an info message
   */
  info(message: string, context?: Record<string, any>): void;

  /**
   * Log a warning message
   */
  warn(message: string, context?: Record<string, any>): void;

  /**
   * Log an error message
   */
  error(message: string, error?: Error, context?: Record<string, any>): void;
}
