# key-pair 

resource "aws_key_pair" "terra-ec2-key-pair" {
  key_name   = "${var.env}-terra-ec2-key"
  public_key = file("../tf-ec2-key-pair.pub")
}

# default vpc 

resource "aws_default_vpc" "default" {

}

# security group

resource "aws_security_group" "terra-security-group" {
  name        = "${var.env}-tf-security-group"
  description = "This security group for inbound and outbound rules for ec2 instance"
  vpc_id      = aws_default_vpc.default.id  # interpolation

}


# Inbound rules

resource "aws_vpc_security_group_ingress_rule" "allow_https" {
  security_group_id = aws_security_group.terra-security-group.id
  cidr_ipv4         = aws_default_vpc.default.cidr_block
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
}

resource "aws_vpc_security_group_ingress_rule" "allow_http" {
  security_group_id = aws_security_group.terra-security-group.id
  cidr_ipv4         = aws_default_vpc.default.cidr_block
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh" {
  security_group_id = aws_security_group.terra-security-group.id
  cidr_ipv4         = aws_default_vpc.default.cidr_block
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

# Outbound rules

resource "aws_vpc_security_group_egress_rule" "allow_all_outbound_traffic" {
  security_group_id = aws_security_group.terra-security-group.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}



resource "aws_instance" "my-terra-ec2"{
	ami = var.ami_id
	instance_type = var.ec2_instance_type
	count = var.ec2_instance_count	

	tags = {
    		Name = "${var.env}-${var.ec2_instance_name}-${count.index + 1}"
            Environment = var.env
  }
  	
	
	key_name = aws_key_pair.terra-ec2-key-pair.key_name

	vpc_security_group_ids = [ aws_security_group.terra-security-group.id ]	

	root_block_device{
		
		volume_size = var.ec2_volume_size
		volume_type = var.ec2_volume_type		
	
	}

}

resource "aws_ec2_instance_state" "instance_state" {
  instance_id = aws_instance.my-terra-ec2[count.index].id
  state = var.ec2_instance_states
}