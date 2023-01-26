resource "aws_alb" "load_balancer" {
  name               = var.alb_name
  internal           = var.internal
  load_balancer_type = var.alb_type
  security_groups    = [var.alb_sg_ids]
  subnets            = toset(data.aws_subnets.subnets.ids)

  enable_deletion_protection = var.enable_deletion_protection
}