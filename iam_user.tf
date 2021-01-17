
resource "aws_iam_user" "user" {
  name = "${var.environment}-user"
  tags = {
    name = "random"
  }
}

/* resource "aws_iam_role" "test_role" {
  name = "test_role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF

  tags = {
      tag-key = "tag-value"
  }
}


resource "aws_iam_role" "prod_list_s3" {
  name = "s3-list-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect    = "Allow",
        Action    = "sts:AssumeRole",
        Principal = { "AWS" : "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root" }
    }]
  })
  #provider = aws.a-role
}

resource "aws_iam_policy" "s3_list_all" {
  name        = "s3_list_all"
  description = "allows listing all s3 buckets"
  policy      = file("role_permissions_policy.json")

  #provider = aws.a-role
}

resource "aws_iam_policy_attachment" "s3_list_all_policicy" {
  name       = "list s3 buckets policy to role"
  roles      = aws_iam_role.prod_list_s3.name
  policy_arn = aws_iam_policy.s3_list_all.arn
  #provider   = aws.a-role
}


output "test" {
  value = data.aws_caller_identity.current.account_id
}
 */
