variable "aws_asg_name" {}

variable "availability_zones" {
  default = ["eu-central-1a", "eu-central-1b", "eu-central-1c"]
}

variable "desired_capacity" {}

variable "min_size" {}

variable "max_size" {}

variable "latest_version" {
  default = "$Latest"
}

variable "aws_launch_template_id" {}

variable "aws_alb_target_group_arn" {}
