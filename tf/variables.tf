variable "region" {
  description = "AWS deployment region"
  default = "us-west-2"
}

variable "environment" {
  default = "production"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "public_subnets_cidr" {
  default = ["10.0.0.0/24"]
}

variable "private_subnets_cidr" {
  default = ["10.0.1.0/24"]
}

variable "production_availability_zones" {
  default = ["us-west-2c", "us-west-2d"]
}
