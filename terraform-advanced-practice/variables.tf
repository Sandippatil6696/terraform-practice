variable "ec2_instance_name" {
  type        = string
  default     = "terra-automate-server"
  description = "This is an ec2 instance name"
}

variable "ec2_instance_type" {
  type        = string
  default     = "t3.micro"
  description = "This is an ec2 instance type"
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
  default     = "stopped"
  description = "This is an ec2 instance state"
}