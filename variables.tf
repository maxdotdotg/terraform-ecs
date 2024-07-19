variable "vpc_id" {
  type        = string
  description = "vpc_id that all the things will live in"
}

variable "alb_subnets" {
  type        = list(string)
  description = "subnet ids the ALB should live in"
}

variable "certificate_arn" {
  type        = string
  description = "ARN for the SSL certificate used by the ALB"
  default     = ""
}

variable "region" {
  type        = string
  description = "aws region the resources will be created in"
}

variable "inbound_ips" {
  description = "list of allowed inbound IP addresses"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "image" {
  type        = string
  description = "docker image"
  default     = ""
}

variable "ecs_subnets" {
  type        = list(string)
  description = "subnets used by the ECS service"
}

variable "https_redirect_enabled" {
  type        = bool
  description = "is the https redirect enabled?"
  default     = false
}

variable "allow_cloudflare" {
  type        = bool
  description = "is cloudflare being used?"
  default     = false
}

variable "desired_count" {
  type        = string
  description = "Number of instances of the task definition to place and keep running"
  default     = ""
}

variable "max_cpu_threshold" {
  type    = string
  default = 85
}

variable "cpu" {
  type        = string
  description = "CPU units per container instance"
  default     = "256"
}

variable "memory" {
  type        = string
  description = "MB of memory per container instance"
  default     = "512"
}

variable "env" {
  type        = string
  default     = "staging"
  description = "what environment are these resources being deployed to?"
}

variable "name" {
  default     = ""
  description = "a unique prefix for resource names"
}

variable "use_ecr" {
  type        = bool
  description = "whether to use ECR"
  default     = "false"
}

variable "ecr_region" {
  type        = string
  description = "region for ECR repo"
  default     = ""
}

variable "ecr_repo_name" {
  type        = string
  description = "name of the ECR repo used"
  default     = ""
}

variable "ecr_tag" {
  type        = string
  description = "desired image tag from ECR repo"
  default     = ""
}

variable "container_port" {
  type        = number
  description = "port the container receives traffic from"
}
