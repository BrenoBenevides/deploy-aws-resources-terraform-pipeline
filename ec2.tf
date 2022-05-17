#data "aws_instance" "ubuntu" {
#  most_recent = true
#
#  filter {
#    name   = "ec2-instance"
#    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
#  }
#
#  filter {
#    name   = "virtualization-type"
#    values = ["hvm"]
#  }
#
#  owners = ["099720109477"] # Canonical
#
#}

resource "aws_instance" "ec2_instance" {
  key_name = "deploy-project-key-pair"
  ami = "ami-0ca285d4c2cda3300"
  instance_type = "t2.micro"
  associate_public_ip_address = true
  security_groups = [aws_default_security_group.ec2_secgroup.name]

  tags = {
    Name = "ec2-instance-project-${terraform.workspace}"

  }
}

resource "aws_vpc" "ec2_vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "aws-ec2-vpc-${terraform.workspace}"
  }
}

resource "aws_subnet" "ec2_subnet" {
  vpc_id     = aws_vpc.ec2_vpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "aws-ec2-subnet-${terraform.workspace}"
  }
}


resource "aws_default_security_group" "ec2_secgroup" {
  vpc_id = aws_vpc.ec2_vpc.id

  ingress {
    protocol  = -1
    self      = true
    from_port = 0
    to_port   = 0
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}