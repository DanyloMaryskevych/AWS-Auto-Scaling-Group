resource "aws_alb_listener" "alb_listener" {
  load_balancer_arn = aws_alb.load_balancer.arn
  port              = 80

  default_action {
    type             = var.listener_forward_action_type
    target_group_arn = aws_alb_target_group.target_group.arn
  }
}