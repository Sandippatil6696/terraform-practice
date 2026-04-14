output "ec2_public_ip" {
  value = aws_instance.my-terra-ec2.public_ip
}

output "ec2_public_dns" {
  value = aws_instance.my-terra-ec2.public_dns
}


output "ec2_public_ip_k8s-server-prod" {
  value = aws_instance.k8s-server.public_ip
}
