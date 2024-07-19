output "ecs_role" {
  value = aws_iam_role.role
}

output "ecs_policy" {
  value = aws_iam_policy.ecs_policy
}
