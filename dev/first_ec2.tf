provider "aws" {
  #access_key = "AKIAWI3SCAQ5DBEA34NA"
  #secret_key = "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"
  region = "us-east-1"
  # version = "~> 3.0"
  /*assume_role {
    role_arn     = "arn:aws:iam::431346549818:role/a-role"
    session_name = "test"
  }*/
}
provider "aws" {
  #access_key = "AKIAWI3SCAQ5DBEA34NA"
  #secret_key = "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"
  region = "ap-south-1"
  alias  = "mumbai"
  # version = "~> 3.0"
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

/*resource "aws_instance" "ec2_instance1" {
  ami           = "ami-04d29b6f966df1537"
  instance_type = "t2.micro"
  #provider = aws.mumbai

}*/

resource "aws_iam_user" "test" {
  name = var.resource_name
  path = "/system/"
  tags = {
    tag-key = "tag-value"
  }
}

resource "aws_s3_bucket" "mybuket" {
  bucket = "sreeni-my-tf-test-bucket"
  acl    = "private"

  tags = {
    Name        = "My bucket"
    Environment = var.resource_name
  }
}

resource "aws_iam_user_policy" "b" {
  name = var.resource_name
  user = aws_iam_user.test.name

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "s3:*"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}
