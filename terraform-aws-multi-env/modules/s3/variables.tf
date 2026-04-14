variable "s3_bucket_name" {
    type = string
    description = "This holds bucket name"
    default = "sandip-aws-multi-env-bucket"
}

variable "env" {
  type        = string
  description = "environment name"
}