resource "aws_ecs_cluster" "cluster" {
  name = "${var.name}-cluster"

  setting {
    name  = "containerInsights"
    value = "disabled"
  }
}
