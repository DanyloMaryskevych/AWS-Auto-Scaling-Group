variable "sg_name" {}

variable "ports_in" {}

variable "ports_out" {}

variable "protocol" {
  default = "tcp"
}
variable "cidr_blocks" {
  default = ["0.0.0.0/0"]
}