terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.40.0"
    }
  }

  backend "s3" {
    bucket = "rmt-backend-bucket-036815016260"
    dynamodb_table = "rmt-backend-bucket-tbl"
    key = "terraform.tfstate"
    region = "us-east-1"
  }
}