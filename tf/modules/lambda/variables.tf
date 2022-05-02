variable "project" {
  type        = string
  description = "Project name"
  default     = "backstage"
}

variable "region" {
  type        = string
  description = "AWS region"
  default     = "us-west-2"
}

variable "public_subnet_id" {
  type = string
  default = ""
}

variable "security_group_id" {
  type = string
  default = ""
}
