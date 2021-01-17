provider "aws" {

  region = "us-east-1"

}

data "aws_caller_identity" "current" {}

terraform {
  required_version = ">= 0.12.4"
  required_providers {
    aws = {
      version = ">= 2.7.0"
      source  = "hashicorp/aws"
    }
  }
}
