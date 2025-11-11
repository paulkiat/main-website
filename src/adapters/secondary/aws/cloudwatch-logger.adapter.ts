// AWS CloudWatch Logger Adapter
// This implements the LoggerPort using AWS CloudWatch Logs

import { LoggerPort, LogLevel } from '../../../core/ports/logger.port';

export class CloudWatchLoggerAdapter implements LoggerPort {
  private logGroupName: string;
  private logStreamName: string;

  constructor(logGroupName: string, logStreamName: string) {
    this.logGroupName = logGroupName;
    this.logStreamName = logStreamName;
  }

  debug(message: string, context?: Record<string, any>): void {
    this.log(LogLevel.DEBUG, message, context);
  }

  info(message: string, context?: Record<string, any>): void {
    this.log(LogLevel.INFO, message, context);
  }

  warn(message: string, context?: Record<string, any>): void {
    this.log(LogLevel.WARN, message, context);
  }

  error(message: string, error?: Error, context?: Record<string, any>): void {
    const errorContext = {
      ...context,
      error: error ? {
        message: error.message,
        stack: error.stack,
        name: error.name
      } : undefined
    };
    this.log(LogLevel.ERROR, message, errorContext);
  }

  private log(level: LogLevel, message: string, context?: Record<string, any>): void {
    const logEntry = {
      timestamp: new Date().toISOString(),
      level,
      message,
      context,
      logGroup: this.logGroupName,
      logStream: this.logStreamName
    };

    // In a real implementation, this would use AWS SDK to send logs to CloudWatch
    // For now, we'll console log with a CloudWatch-like format
    console.log(JSON.stringify(logEntry));
  }
}
