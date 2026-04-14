resource "aws_dynamodb_table" "multi-env-dynamodb-table" {
  name           = "${var.dynamodb_table_name}-${count.index + 1 }"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockID"
  count = var.dynamodb_table_count

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Environment = var.env
  }

}