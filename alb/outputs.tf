output "alb" {
  value = aws_lb.alb
}

output "target_group" {
  value = aws_lb_target_group.target_group
}

output "alb_to_ecs_security_group" {
  value = aws_security_group.inbound_from_alb
}
