terraform {
  required_version = "~> 1.1.0"
}

provider "aws" {
  region = "ap-northeast-1"

  default_tags {
    tags = {
      product = "wordpress"
    }
  }
}

# VPC
module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = var.vpc_name
  cidr = var.cidr

  azs             = var.azs
  private_subnets = var.public_subnets
  public_subnets  = var.private_subnets

  enable_nat_gateway = false
  enable_vpn_gateway = false
}

#EC2 SG
module "http80_sg" {
  source = "terraform-aws-modules/security-group/aws//modules/http-80"

  name        = "http-sg"
  description = "HTTP"
  vpc_id      = module.vpc.vpc_id

  ingress_cidr_blocks = ["0.0.0.0/0"]
}

module "https443_sg" {
  source = "terraform-aws-modules/security-group/aws//modules/https-443"

  name        = "https-sg"
  description = "HTTPS"
  vpc_id      = module.vpc.vpc_id

  ingress_cidr_blocks = ["0.0.0.0/0"]
}

module "ssh22_sg" {
  source = "terraform-aws-modules/security-group/aws//modules/ssh"

  name        = "ssh-sg"
  description = "ssh"
  vpc_id      = module.vpc.vpc_id

  ingress_cidr_blocks = ["0.0.0.0/0"]
}


#RDS SG
module "mysql_sg" {
  source = "terraform-aws-modules/security-group/aws//modules/mysql"

  name        = "mysql-sg"
  description = "mysql"
  vpc_id      = module.vpc.vpc_id

  ingress_cidr_blocks = [var.cidr]
}










