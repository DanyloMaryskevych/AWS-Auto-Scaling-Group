module "aws_launch_template" {
  source = "./module/aws-launch-template"

  name          = "Test-launch-template"
  ec2_sg_ids    = module.ec2_sg.aws_sg_id
  key_pair_name = "Sonderling"
}