provider "aws" {
  region     = "eu-central-1"
  access_key = var.access_key
  secret_key = var.secret_key
}
#
#resource "aws_security_group" "ec2_ssh_http_open_sg" {
#  name        = "EC2-SSH-HTTP-open-sg"
#  description = "EC2 SSH and HTTP open"
#
#  ingress {
#    from_port   = 80
#    to_port     = 80
#    protocol    = "tcp"
#    cidr_blocks = ["0.0.0.0/0"]
#  }
#
#  ingress {
#    from_port   = 22
#    to_port     = 22
#    protocol    = "tcp"
#    cidr_blocks = ["0.0.0.0/0"]
#  }
#
#  egress {
#    from_port   = 0
#    to_port     = 0
#    protocol    = "-1"
#    cidr_blocks = ["0.0.0.0/0"]
#  }
#}
#
#resource "aws_security_group" "lb_http_open_sg" {
#  name        = "Load-Balancer-HTTP-open-sg"
#  description = "Load Balancer HTTP open sg"
#
#  ingress {
#    from_port   = 80
#    to_port     = 80
#    protocol    = "tcp"
#    cidr_blocks = ["0.0.0.0/0"]
#  }
#
#  egress {
#    from_port   = 0
#    to_port     = 0
#    protocol    = "-1"
#    cidr_blocks = ["0.0.0.0/0"]
#  }
#}
#
#
#
#resource "aws_launch_template" "basic_launch_template" {
#  name = "Terraform-test-launch-template"
#
#  image_id                = "ami-0a261c0e5f51090b1"
#  instance_type           = "t2.micro"
#  disable_api_termination = "false"
#
#  vpc_security_group_ids = [aws_security_group.ec2_ssh_http_open_sg.id]
#  key_name               = data.aws_key_pair.sonderling.key_name
#
#  user_data = base64encode(file("init.sh"))
#}
#
#resource "aws_autoscaling_group" "asg" {
#  name = "EC2 Scaling"
#
#  availability_zones = ["eu-central-1a", "eu-central-1b", "eu-central-1c"]
#  desired_capacity   = 2
#  min_size           = 1
#  max_size           = 4
#
#  launch_template {
#    id      = aws_launch_template.basic_launch_template.id
#    version = "$Latest"
#  }
#
#  target_group_arns = [aws_alb_target_group.target_group.arn]
#}
#
#
#data "aws_subnets" "example" {
#  filter {
#    name   = "vpc-id"
#    values = ["vpc-0c268766bcb7b13d5"]
#  }
#}
#
#resource "aws_alb" "load_balancer" {
#  name               = "test-lb-tf"
#  internal           = false
#  load_balancer_type = "application"
#  security_groups    = [aws_security_group.lb_http_open_sg.id]
#  subnets            = toset(data.aws_subnets.example.ids)
#
#  enable_deletion_protection = false
#}
#
#resource "aws_alb_target_group" "target_group" {
#  name     = "Default-target-group"
#  port     = 80
#  protocol = "HTTP"
#
#  vpc_id      = "vpc-0c268766bcb7b13d5"
#  target_type = "instance"
#}
#
#resource "aws_alb_listener" "alb_listener" {
#  load_balancer_arn = aws_alb.load_balancer.arn
#  port              = 80
#
#  default_action {
#    type             = "forward"
#    target_group_arn = aws_alb_target_group.target_group.arn
#  }
#}
#
## autoscaling policies
#
#resource "aws_autoscaling_policy" "scale_down_policy" {
#  name                   = "Scale down policy"
#  autoscaling_group_name = aws_autoscaling_group.asg.name
#  adjustment_type        = "ChangeInCapacity"
#  scaling_adjustment     = -1
#  cooldown               = 60
#}
#
#resource "aws_cloudwatch_metric_alarm" "cloudwatch_metric_alarm" {
#  alarm_name          = "Lower Network In than 5000 bytes"
#  comparison_operator = "LessThanOrEqualToThreshold"
#  evaluation_periods  = 1
#  metric_name         = "NetworkIn"
#  namespace           = "AWS/EC2"
#  period              = "60" #seconds
#  statistic           = "Average"
#  threshold           = "5000"
#  alarm_description   = "This metric monitors when Network In (bytes) is lower than 5000 bytes"
#
#  alarm_actions     = [aws_autoscaling_policy.scale_down_policy.arn]
#
#  dimensions = {
#    AutoScalingGroupName = aws_autoscaling_group.asg.name
#  }
#}
#
#resource "aws_autoscaling_policy" "scale_up_policy" {
#  name                   = "Scale up policy"
#  autoscaling_group_name = aws_autoscaling_group.asg.name
#  adjustment_type        = "ChangeInCapacity"
#  scaling_adjustment     = 1
#  cooldown               = 60
#
#}
#
#resource "aws_cloudwatch_metric_alarm" "scale_up_policy_alarm" {
#  alarm_name    = "Scale up alarm"
#  alarm_actions = [aws_autoscaling_policy.scale_up_policy.arn]
#  namespace     = "AWS/EC2"
#
#  comparison_operator = "GreaterThanThreshold"
#  evaluation_periods  = 1
#  metric_name         = "NetworkIn"
#  threshold           = "5000"
#  period              = "60"
#  statistic           = "Average"
#
#  dimensions = {
#    AutoScalingGroupName = aws_autoscaling_group.asg.name
#  }
#
#}