
provider "aws" {}


variable "project_name" {
  default = "zomato"
}

variable "project_env" {

  default = "prod"
}


resource "aws_security_group" "webserver" {

  name        = "webserver-${var.project_name}-${var.project_env}"
  description = "webserver security group"


  ingress {

    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }


  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {

    Name    = "webserver-${var.project_name}-${var.project_env}"
    project = var.project_name
    env     = var.project_env
  }

}
