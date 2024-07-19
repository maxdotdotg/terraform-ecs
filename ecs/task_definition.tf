data "aws_caller_identity" "current" {}

locals {
  ecr_repo = "${data.aws_caller_identity.current.account_id}.dkr.ecr.${var.ecr_region}.amazonaws.com/${var.ecr_repo_name}:${var.ecr_tag}"
  image    = var.use_ecr == false ? var.image : local.ecr_repo
}

resource "aws_ecs_task_definition" "task" {
  family             = var.name
  network_mode       = "awsvpc"
  cpu                = var.cpu
  memory             = var.memory
  execution_role_arn = var.execution_role_arn
  task_role_arn      = aws_iam_role.ecs_task_execution.arn

  container_definitions = jsonencode([
    {
      name      = var.name
      image     = local.image
      essential = true
      linux_parameters = {
        init_process_enabled = "true"
      }

      "environment" : [
        { "name" : "MY_ENV_VAR", "value" : "the value of my app's env var" },
      ],

      logConfiguration = {
        logDriver = "awslogs"
        options = {
          awslogs-group         = aws_cloudwatch_log_group.logs.name
          awslogs-region        = var.logs_region
          awslogs-stream-prefix = "ecs"
        }
      }
      portMappings = [
        {
          containerPort = var.container_port
        }
      ]
    },
  ])

  requires_compatibilities = ["FARGATE"]

  tags = {
    name = var.name
  }
}
