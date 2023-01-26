module "ec2_sg" {
  source = "./module/aws-security-group"

  sg_name   = "EC2-SSH-HTTP-open"
  ports_in  = [22, 80]
  ports_out = [0]


}

module "alb_sg" {
  source = "./module/aws-security-group"

  sg_name   = "APP-Load-Balancer-HTTP-open"
  ports_in  = [80]
  ports_out = [0]
}