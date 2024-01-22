variable "region" {
  default = "eu-west-1"
}

variable "ami" {
  default = "ami-0905a3c97561e0b69"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "project_name" {
  default = "dev"
}

variable "key_pair" {
  default = "dev-key"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "subnet1_cidr" {
  default = "10.0.0.0/24"
}
variable "subnet2_cidr" {
  default = "10.0.32.0/24"
}
variable "subnet3_cidr" {
  default = "10.0.64.0/24"
}

variable "domain_name" {
  default     = "prayandcode.com.ng"
  type        = string
  description = "My domain name"
}
