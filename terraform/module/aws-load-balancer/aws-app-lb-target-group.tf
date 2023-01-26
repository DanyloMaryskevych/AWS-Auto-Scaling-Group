resource "aws_alb_target_group" "target_group" {
  name     = var.tg_name
  port     = var.tg_port
  protocol = var.tg_http_protocol

  vpc_id      = var.vpc_ids
  target_type = var.target_type
}