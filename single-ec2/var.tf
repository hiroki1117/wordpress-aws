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
    "ap-northeast-1a" ,
    "ap-northeast-1c"
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
    "192.168.101.0/24" ,
    "192.168.102.0/24"
  ]
}

variable "incetance_type" {
  type    = string
  default = "t2.micro"
}

variable "db_name" {
  type    = string
  default = "wordpressrds"
}

variable "engine" {
  type    = string
  default = "mysql"
}

variable "engine_version" {
  type    = string
  default = "8.0.23"
}

variable "db_instance" {
  type    = string
  default = "db.t2.micro"
}

variable "db_username" {
  type    = string
  default = "admin"
}

variable "db_password" {
  type    = string
  default = "hoge1117"
  # 使用する時は変更してね
}

