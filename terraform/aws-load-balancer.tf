module "aws-alb" {
  source = "./module/aws-load-balancer"

  alb_name   = "Test-load-balancer"
  alb_sg_ids = module.alb_sg.aws_sg_id

  tg_name    = "Test-target-group"
  tg_port    = 80
}