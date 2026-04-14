#S3

resource "aws_s3_bucket" "remote-s3-bucket" {
  bucket = "rmt-backend-bucket-036815016260"

  tags = {
    Name = "rmt-backend-bucket-036815016260"
  }
}

resource "aws_dynamodb_table" "remote-dynamodb-table" {
  name           = "rmt-backend-bucket-tbl"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

}

