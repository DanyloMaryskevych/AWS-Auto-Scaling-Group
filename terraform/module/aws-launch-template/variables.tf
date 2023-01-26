variable "name" {}

variable "image_id" {
  description = "Image Id forAmazon Linux instance for eu-central-1 region"
  default = "ami-0a261c0e5f51090b1"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "key_pair_name" {
  description = "Sonderling"
}

variable "disable_api_termination" {
  default = "false"
}

variable "ec2_sg_ids" {}

variable "startup_file_path" {
  description = "File with user data for EC2 instance"
  default = "start-up/init.sh"
}