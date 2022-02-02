terraform {
  required_version = "1.1.4"
  required_providers {
    aws = {
      source  = "hashicorp/aws",
      version = "3.74.0"
    }
  }
}

provider "aws" {
  region  = var.aws_region
  profile = var.profile
}

resource "aws_instance" "ec2-instance-k8s" {
  count         = 6
  ami           = var.instace_ami_medium
  instance_type = var.instance_type_medium

  key_name = "gmiranda"

  vpc_security_group_ids = [aws_security_group.security-group-k8s.id]

  tags = {
    Name = "k8s"
  }
}

resource "aws_instance" "ec2-instance-haproxy" {
  ami           = var.instace_ami_micro
  instance_type = var.instance_type_micro

  key_name = "gmiranda"

  vpc_security_group_ids = [aws_security_group.security-group-k8s.id]

  tags = {
    Name = "haproxy-k8s"
  }
}
