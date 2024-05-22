/*
# This data source would help you get the latest ami for your ec2 instance provisioning
data "aws_ami" "amzlinux2" {
  most_recent      = true
  owners           = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-5.10-hvm-*-gp2"] #Take an ami from launch instance in console and go under "AMI" to search to get the name
    #al2023-ami-2023.0.20230503.0-kernel-6.1-x86_64 This is for AL 2023
    #amzn2-ami-kernel-5.10-hvm-2.0.20230418.0-x86_64-gp2 This is for HVM
    #[ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd-server-*"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}

*/

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}


/*
resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"

  tags = {
    Name = "HelloWorld"
  }
}
*/

resource "aws_instance" "ERICSSON" {
#ami               = data.aws_ami.amzlinux2.id
ami                = data.aws_ami.ubuntu.id
instance_type      = var.instance_type
key_name   = var.key-name
vpc_security_group_ids = [ aws_security_group.vpc_prod_secgrp.id ]
subnet_id = aws_subnet.vpc_prod_subnet1.id
user_data          = file("install_applications.sh")

count = 1
tags = {
  #Name = "ERICSSON"
  Name = "ERICSSON-${count.index}"
  } 
}


/***
resource "aws_route53_zone" "my_zone" {
  name = "mydomain.com"
}

resource "aws_route53_record" "www_mydomain_com" {
  zone_id = "${aws_route53_zone.my_zone.zone_id}"
  name    = "www.mydomain.com"
  type    = "A"
  ttl     = "300"
  records = ["192.0.2.44"]
}
***/