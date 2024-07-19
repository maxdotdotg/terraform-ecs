module "alb" {
  source                 = "./alb"
  subnets                = var.alb_subnets
  vpc_id                 = var.vpc_id
  https_redirect_enabled = var.https_redirect_enabled
  allow_cloudflare       = var.allow_cloudflare
  inbound_ips            = var.inbound_ips
  certificate_arn        = var.certificate_arn
  name                   = var.name
  container_port         = var.container_port
}

module "iam" {
  source = "./iam"
  region = var.region
  name   = var.name

  # ECR configs
  use_ecr       = var.use_ecr
  ecr_repo_name = var.ecr_repo_name
  ecr_region    = var.ecr_region
}

module "ecs" {
  source = "./ecs"

  # choose between desired_count from tfvars or matching the number of available subnets
  desired_count = coalesce(var.desired_count, length(var.ecs_subnets))

  image              = var.image
  task_family_name   = var.name
  logs_region        = var.region
  execution_role_arn = module.iam.ecs_role.arn
  iam_role_policy    = module.iam.ecs_policy.id
  target_group_arn   = module.alb.target_group.arn
  security_groups    = [module.alb.alb_to_ecs_security_group.id]
  subnets            = var.ecs_subnets
  memory             = var.memory
  cpu                = var.cpu
  name               = var.name
  container_port     = var.container_port

  # ECR configs
  use_ecr       = var.use_ecr
  ecr_repo_name = var.ecr_repo_name
  ecr_region    = var.ecr_region
  ecr_tag       = var.ecr_tag
}
