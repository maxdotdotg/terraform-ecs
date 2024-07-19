variable "image" {
  type        = string
  description = "image location"
}

variable "task_family_name" {
  type        = string
  description = "name of the ECS task"
}

variable "logs_region" {
  type        = string
  description = "region to store logs"
}

variable "iam_role_policy" {
  type        = string
  description = "IAM role policy used by ECS service"
}

variable "target_group_arn" {
  type        = string
  description = "ARN of the load balancer target group"
}

variable "security_groups" {
  type        = list(string)
  description = "security groups used by the ECS service"
}

variable "subnets" {
  type        = list(string)
  description = "subnets used by the ECS service"
}

variable "execution_role_arn" {
  type        = string
  description = "ARN for execution role used by ECS task"
}

variable "desired_count" {
  type        = number
  description = "Number of instances of the task definition to place and keep running"
  default     = 1
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

variable "max_cpu_threshold" {
  type    = string
  default = "85"
}

variable "name" {
  type        = string
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
  description = "port the container receives traffic on"
  type        = number
}
