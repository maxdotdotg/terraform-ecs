resource "aws_cloudwatch_log_group" "logs" {
  name = "/ecs/${var.name}"
}
