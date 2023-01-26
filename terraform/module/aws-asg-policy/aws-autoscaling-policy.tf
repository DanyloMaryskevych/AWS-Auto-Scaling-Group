resource "aws_autoscaling_policy" "asg_policy" {
  name                   = var.policy_name
  autoscaling_group_name = var.aws_asg_name
  adjustment_type        = var.adjustment_type
  scaling_adjustment     = var.scaling_adjustment
  cooldown               = var.cooldown
}