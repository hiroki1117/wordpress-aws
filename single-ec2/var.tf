variable "vpc_name" {
  type    = string
  default = "ec2wordpressvpc"
}

variable "cidr" {
  type    = string
  default = "192.168.0.0/16"
}

variable "azs" {
  type = list(string)

  default = [
    "ap-northeast-1a"
  ]
}

variable "public_subnets" {
  type = list(string)

  default = [
    "192.168.1.0/24"
  ]
}

variable "private_subnets" {
  type = list(string)

  default = [
    "192.168.101.0/24"
  ]
}