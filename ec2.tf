#data "aws_instance" "ubuntu" {
#
#  filter {
#    name   = "ec2-instance}"
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
#
#resource "aws_instance" "ec2_instance" {
#  key_name = "deploy-project-key-pair.pem"
#  ami = data.aws_instance.ubuntu.id
#  instance_type = "t2.micro"
#  associate_public_ip_address = true
#
#  tags = {
#    Name = "ec2-instance-project-${terraform.workspace}"
#
#  }
#}