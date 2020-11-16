data "aws_caller_identity" "current" {}

module "bucket" {
  source = "../.."

  bucket                        = "${data.aws_caller_identity.current.account_id}-terraform-state"
  versioned                     = true
  encrypted                     = true
  mfa_delete = var.mfa_delete
}

resource "aws_dynamodb_table" "tf_lock" {
  hash_key = "LockID"
  name = "terraform-lock"
  attribute {
    name = "LockID"
    type = "S"
  }
  billing_mode = "PAY_PER_REQUEST"
}
