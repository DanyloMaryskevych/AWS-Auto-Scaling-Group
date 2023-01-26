module "aws_asg" {
  source = "./module/aws-autoscaling-group"

  aws_asg_name = "EC2-load-test-asg"

  desired_capacity = 2
  min_size         = 1
  max_size         = 4

  aws_alb_target_group_arn = module.aws-alb.aws_alb_target_group_arn
  aws_launch_template_id   = module.aws_launch_template.aws_launch_template_id
}