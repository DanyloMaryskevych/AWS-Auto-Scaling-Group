locals {
  ports_in  = var.ports_in
  ports_out = var.ports_out
}

resource "aws_security_group" "aws_sg" {
  name = var.sg_name

  dynamic "ingress" {
    for_each = toset(local.ports_in)
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = var.protocol
      cidr_blocks = var.cidr_blocks
    }
  }

  dynamic "egress" {
    for_each = toset(local.ports_out)
    content {
      from_port   = egress.value
      to_port     = egress.value
      protocol    = var.protocol
      cidr_blocks = var.cidr_blocks
    }
  }
}