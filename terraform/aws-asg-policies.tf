module "scale_up_alarm_and_policy" {
  source = "./module/aws-asg-policy"

  policy_name         = "Scale Up Policy"
  adjustment_type     = var.adjustment_type
  scaling_adjustment  = 1
  cooldown            = var.cooldown
  aws_asg_name        = module.aws_asg.aws_asg_name

  alarm_description   = "This metric monitors when Network In (bytes) is higher than 5000 bytes"
  alarm_name          = "High Network In Alarm"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = var.evaluation_periods
  metric_name         = var.network_in_metric
  namespace           = var.namespace
  period              = var.period
  statistic           = var.statistic
  threshold           = 5000
}


module "scale_down_alarm_and_policy" {
  source = "./module/aws-asg-policy"

  policy_name         = "Scale Down Policy"
  adjustment_type     = var.adjustment_type
  scaling_adjustment  = 1
  cooldown            = var.cooldown
  aws_asg_name        = module.aws_asg.aws_asg_name

  alarm_description   = "This metric monitors when Network In (bytes) is lower than 5000 bytes"
  alarm_name          = "Low Network In Alarm"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods  = var.evaluation_periods
  metric_name         = var.network_in_metric
  namespace           = var.namespace
  period              = var.period
  statistic           = var.statistic
  threshold           = 5000
}
