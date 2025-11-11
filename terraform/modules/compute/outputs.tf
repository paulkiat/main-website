output "deployment_role_arn" {
  description = "ARN of the deployment role"
  value       = aws_iam_role.github_actions.arn
}

output "deployment_role_name" {
  description = "Name of the deployment role"
  value       = aws_iam_role.github_actions.name
}
