variable "alb_name" {}

variable "alb_type" {
  default = "application"
}

variable "internal" {
  default = false
}

variable "enable_deletion_protection" {
  default = false
}

variable "alb_sg_ids" {}

variable "vpc_ids" {
  default = "vpc-0c268766bcb7b13d5"
}

variable "listener_forward_action_type" {
  default = "forward"
}

variable "tg_name" {}

variable "target_type" {
  default = "instance"
}

variable "tg_http_protocol" {
  default = "HTTP"
}

variable "tg_port" {}
