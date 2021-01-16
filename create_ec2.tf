provider "aws" {
 
  region = "us-east-1"

}


terraform {
  required_version = ">= 0.12.4"
  required_providers {
    aws = {
      version = ">= 2.7.0"
      source  = "hashicorp/aws"
    }
  }
}


resource "aws_iam_user" "test" {
  name = var.resource_name
  path = "/system/"
  tags = {
    tag-key = "tag-value"
  }
}
