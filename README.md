# terraform-ecs

Deploy a container using AWS ECS with an ALB in front of it

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.62.0 |
| <a name="requirement_http"></a> [http](#requirement\_http) | ~> 3.2.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | ~> 3.4.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_alb"></a> [alb](#module\_alb) | ./alb | n/a |
| <a name="module_ecs"></a> [ecs](#module\_ecs) | ./ecs | n/a |
| <a name="module_iam"></a> [iam](#module\_iam) | ./iam | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_alb_subnets"></a> [alb\_subnets](#input\_alb\_subnets) | subnet ids the ALB should live in | `list(string)` | n/a | yes |
| <a name="input_allow_cloudflare"></a> [allow\_cloudflare](#input\_allow\_cloudflare) | is cloudflare being used? | `bool` | `false` | no |
| <a name="input_certificate_arn"></a> [certificate\_arn](#input\_certificate\_arn) | ARN for the SSL certificate used by the ALB | `string` | `""` | no |
| <a name="input_container_port"></a> [container\_port](#input\_container\_port) | port the container receives traffic from | `number` | n/a | yes |
| <a name="input_cpu"></a> [cpu](#input\_cpu) | CPU units per container instance | `string` | `"256"` | no |
| <a name="input_desired_count"></a> [desired\_count](#input\_desired\_count) | Number of instances of the task definition to place and keep running | `string` | `""` | no |
| <a name="input_ecr_region"></a> [ecr\_region](#input\_ecr\_region) | region for ECR repo | `string` | `""` | no |
| <a name="input_ecr_repo_name"></a> [ecr\_repo\_name](#input\_ecr\_repo\_name) | name of the ECR repo used | `string` | `""` | no |
| <a name="input_ecr_tag"></a> [ecr\_tag](#input\_ecr\_tag) | desired image tag from ECR repo | `string` | `""` | no |
| <a name="input_ecs_subnets"></a> [ecs\_subnets](#input\_ecs\_subnets) | subnets used by the ECS service | `list(string)` | n/a | yes |
| <a name="input_env"></a> [env](#input\_env) | what environment are these resources being deployed to? | `string` | `"staging"` | no |
| <a name="input_https_redirect_enabled"></a> [https\_redirect\_enabled](#input\_https\_redirect\_enabled) | is the https redirect enabled? | `bool` | `false` | no |
| <a name="input_image"></a> [image](#input\_image) | docker image | `string` | `""` | no |
| <a name="input_inbound_ips"></a> [inbound\_ips](#input\_inbound\_ips) | list of allowed inbound IP addresses | `list(string)` | <pre>[<br>  "0.0.0.0/0"<br>]</pre> | no |
| <a name="input_max_cpu_threshold"></a> [max\_cpu\_threshold](#input\_max\_cpu\_threshold) | n/a | `string` | `85` | no |
| <a name="input_memory"></a> [memory](#input\_memory) | MB of memory per container instance | `string` | `"512"` | no |
| <a name="input_name"></a> [name](#input\_name) | a unique prefix for resource names | `string` | `""` | no |
| <a name="input_region"></a> [region](#input\_region) | aws region the resources will be created in | `string` | n/a | yes |
| <a name="input_use_ecr"></a> [use\_ecr](#input\_use\_ecr) | whether to use ECR | `bool` | `"false"` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | vpc\_id that all the things will live in | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_dns"></a> [dns](#output\_dns) | n/a |
