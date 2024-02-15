terraform {
  required_version = ">= 0.14, < 0.16"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }
}

provider "aws" {
  region = "us-west-2" # We can adjust our regions based on our requirment
}
