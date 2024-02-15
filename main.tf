provider "aws" {
  region = "us-west-2" # Here i have hard coded region for now we can add other regions as well
}

resource "aws_elastic_beanstalk_application" "app" {
  name        = var.application_name
  description = "EB application demonstrating auto-scaling based on CPU load."
}

resource "aws_elastic_beanstalk_environment" "env" {
  name                = "${var.application_name}-env"
  application         = aws_elastic_beanstalk_application.app.name
  solution_stack_name = "64bit Amazon Linux 2 v3.3.6 running Python 3.8" ## its just random name 

  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "InstanceType"
    value     = "t2.micro"
  }

  setting {
    namespace = "aws:autoscaling:asg"
    name      = "MinSize"
    value     = "2"
  }

  setting {
    namespace = "aws:autoscaling:asg"
    name      = "MaxSize"
    value     = "4"
  }

  tags = var.tags
}
