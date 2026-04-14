variable "env" {
  type        = string
  description = "environment name"
}

variable "ec2_instance_count" {
  type        = number
  default     = 1
  description = "This holds ec2 instance count"
}

variable "ec2_instance_name" {
  type        = string
  default     = "terra-ec2-instance"
  description = "This is an ec2 instance name"
}



variable "ec2_instance_type" {
  type        = string
  default     = "t3.micro"
  description = "This is an ec2 instance type"
}


variable "ami_id" {
  type        = string
  default     = "ami-0ec10929233384c7f"
  description = "This holds  ec2 instance ami id"
}

variable "ec2_volume_type" {
  type        = string
  default     = "gp3"
  description = "This is an ec2 volume type"
}


variable "ec2_volume_size" {
  type        = number
  default     = 20
  description = "This is an ec2 instance volume size"
}

variable "ec2_instance_states" {
  type        = string
  default     = "running"
  description = "This is an ec2 instance state"
}