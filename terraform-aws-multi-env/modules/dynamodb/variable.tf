variable "dynamodb_table_name" {
  type        = string
  default     = "multi-env-tbl"
  description = "This holds dynamodb table name"
}

variable "env" {
  type        = string
  description = "environment name"
}

variable "dynamodb_table_count" {
    type = number
    description = "This holds bucker count"
  
}