resource "aws_s3_bucket" "multi-env-s3-bucket" {
  bucket = "${var.s3_bucket_name}-${count.index + 1 }"
  count = var.s3_bucket_count

  tags = {
    Name = "${var.s3_bucket_name}-${count.index + 1 }"
    Environment = var.env
  }
}
