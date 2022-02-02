variable "aws_region" {
  type        = string
  description = "AWS Region"
  default     = "us-east-2"
}

variable "profile" {
  type        = string
  description = "Profile"
  default     = "default"
}

variable "instace_ami_medium" {
  type    = string
  default = "ami-0fb653ca2d3203ac1"
}

variable "instance_type_medium" {
  type    = string
  default = "t2.medium"
}

variable "instace_ami_micro" {
  type    = string
  default = "ami-0fb653ca2d3203ac1"
}

variable "instance_type_micro" {
  type    = string
  default = "t2.micro"
}
