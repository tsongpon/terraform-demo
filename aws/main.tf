terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = "ap-southeast-1"
}

resource "aws_instance" "app_server" {
  ami           = "ami-05c8486d62efc5d07"
  instance_type = "t2.micro"
  associate_public_ip_address = true
  key_name = "songpon-aws-key"
  subnet_id = "subnet-04623c2fa31b46497"
  security_groups = [ "sg-00e3c3bffc97ab859" ]

  tags = {
    Name = "application server"
  }
}

resource "aws_instance" "db_server" {
  ami           = "ami-05c8486d62efc5d07"
  instance_type = "t2.large"
  associate_public_ip_address = true
  key_name = "songpon-aws-key"
  subnet_id = "subnet-04623c2fa31b46497"
  security_groups = [ "sg-00e3c3bffc97ab859" ]

  tags = {
    Name = "database server"
  }
}
