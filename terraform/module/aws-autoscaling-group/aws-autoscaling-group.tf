resource "aws_autoscaling_group" "asg" {
  name = var.aws_asg_name

  availability_zones = var.availability_zones
  desired_capacity   = var.desired_capacity
  min_size           = var.min_size
  max_size           = var.max_size

  launch_template {
    id = var.aws_launch_template_id
    version = var.latest_version
  }

  target_group_arns = [var.aws_alb_target_group_arn]
}