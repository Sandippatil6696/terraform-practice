# configure provider
provider "aws" {

	region="us-east-1"
}


# key-pair 

resource "aws_key_pair" "terra-ec2-key-pair" {
  key_name   = "terra-ec2-key"
  public_key = file("../tf-ec2-key-pair.pub")
}

# default vpc 

resource "aws_default_vpc" "default" {

}

# security group

resource "aws_security_group" "terra-security-group" {
  name        = "tf-security-group"
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
	ami = "ami-0ec10929233384c7f"
	instance_type = "t3.micro"
	#count = 1	
	tags = {
    		Name = "terra-ec2-instance"
  	}
	
	key_name = aws_key_pair.terra-ec2-key-pair.key_name

	vpc_security_group_ids = [ aws_security_group.terra-security-group.id ]	

	root_block_device{
		
		volume_size = 10
		volume_type = "gp3"		
	
	}

}

resource "aws_ec2_instance_state" "instance_state" {
  instance_id = aws_instance.my-terra-ec2.id
  state = "stopped"
}