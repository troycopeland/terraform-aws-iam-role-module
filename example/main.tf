provider "aws" {
  region = "us-east-1"
}

module "iam_role_example" {
  source = "../"

  role_name           = "example-terraform-module-role"
  assume_role_policy  = data.aws_iam_policy_document.assume_ec2.json
  managed_policy_arns = [
    "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
  ]

  tags = {
    Project = "iam-module"
    Owner   = "troycopeland"
  }
}

data "aws_iam_policy_document" "assume_ec2" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}