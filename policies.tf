data "aws_iam_policy_document" "public_read" {
  statement {
    sid       = "PublicReadGetObject"
    effect    = "Allow"
    actions   = ["s3:GetObject"]
    resources = ["*"]

    principals {
      identifiers = ["*"]
      type        = "AWS"
    }
  }
}

data "aws_iam_policy_document" "public_read_cidr" {
  count = var.public_read_cidr != "" ? 1 : 0

  statement {
    sid       = "PublicReadGetObject"
    effect    = "Allow"
    actions   = ["s3:GetObject"]
    resources = ["*"]

    principals {
      identifiers = ["*"]
      type        = "AWS"
    }

    condition {
      test     = "IpAddress"
      variable = "aws:SourceIp"
      values   = var.public_read_cidr
    }
  }
}

locals {
  policies = {
    public_read = var.public_read_cidr != "" ? data.aws_iam_policy_document.public_read_cidr[0].json : data.aws_iam_policy_document.public_read
  }
}
