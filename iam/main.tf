data "aws_caller_identity" "current" {}

# role for ECS
resource "aws_iam_role" "role" {
  name = "${var.name}-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Principal = {
          Service = "ecs-tasks.amazonaws.com"
        }
        Effect = "Allow"
        Sid    = "ECSTasksAssumeRole"
      }
    ]
  })
}

# IAM policy for ECS task
resource "aws_iam_policy" "ecs_policy" {
  name        = "${var.name}_ecs_policy"
  description = "provide app access to logs"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents",
          "logs:DescribeLogStreams"
        ]
        Effect   = "Allow"
        Resource = "arn:aws:logs:*:*:*"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "attach" {
  role       = aws_iam_role.role.name
  policy_arn = aws_iam_policy.ecs_policy.arn
}

# allow read access to ECR
data "aws_iam_policy_document" "ecr_read" {
  # only create if using ECR
  count = var.use_ecr ? 1 : 0
  statement {
    sid    = "ECRRead"
    effect = "Allow"
    actions = [
      "ecr:BatchGetImage",
      "ecr:GetDownloadUrlForLayer",
      "ecr:GetAuthorizationToken"
    ]
    resources = ["*"]
  }
}

resource "aws_iam_policy" "ecs_use_ecr" {
  # only create if using ECR
  count       = var.use_ecr ? 1 : 0
  name        = "${var.name}-use-ecr"
  description = "get containers from ECR"
  policy      = data.aws_iam_policy_document.ecr_read[0].json
}

resource "aws_iam_role_policy_attachment" "ecs_use_ecr" {
  # only create if using ECR
  count      = var.use_ecr ? 1 : 0
  role       = aws_iam_role.role.name
  policy_arn = aws_iam_policy.ecs_use_ecr[0].arn
}
