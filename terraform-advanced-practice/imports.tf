import {
  id = "i-031519d3714431da5"
  to = aws_instance.k8s-server
}

resource "aws_instance" "k8s-server" {
  ami = "ami-0ec10929233384c7f"
  instance_type = "t3.medium"
  key_name = "k8s-server-key"
  tags = {
    Name = "k8s-server-prod"
  }
}

resource "aws_ec2_instance_state" "instance_stae" {
    state = "stopped"
    instance_id = aws_instance.k8s-server.id
}