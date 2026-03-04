variable "region" {
  description = "AWS region"
  type        = string
}

variable "vpc_cidr" {
  description = "VPC CIDR block"
  type        = string
}

variable "public_subnet_cidr" {
  description = "Public subnet CIDR"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "app_port" {
  description = "Application port"
  type        = number
}

variable "ssh_cidr" {
  description = "Allowed SSH CIDR"
  type        = string
}

variable "internet_cidr" {
  type    = string
  default = "0.0.0.0/0"
}