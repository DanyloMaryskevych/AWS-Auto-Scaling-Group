resource "aws_launch_template" "aws_launch_template" {
  name = var.name

  image_id                = var.image_id
  instance_type           = var.instance_type
  disable_api_termination = var.disable_api_termination

  vpc_security_group_ids = [var.ec2_sg_ids]
  key_name               = data.aws_key_pair.sonderling.key_name

  user_data = base64encode(file("${path.module}/${var.startup_file_path}"))
}