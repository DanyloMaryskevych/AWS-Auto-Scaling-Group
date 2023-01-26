variable "access_key" {}

variable "secret_key" {}

variable "adjustment_type" {
  default = "ChangeInCapacity"
}

variable "cooldown" {
  default = 60
}

variable "network_in_metric" {
  description = "All metrics: https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/viewing_metrics_with_cloudwatch.html"
  default = "NetworkIn"
}

variable "namespace" {
  default = "AWS/EC2"
}

variable "period" {
  default = 60
}

variable "statistic" {
  default = "Average"
}

variable "evaluation_periods" {
  default = 1
}