resource "aws_instance" "web_prod" {
  ami           = data.aws_ami.amzlinux2.id
  instance_type = var.instance_type
  key_name      = var.ec2_key
  subnet_id     = var.private_subnets_id

  tags = {
    Name        = "Prod_ec2"
    Environment = var.Environment[0]
  }
}

resource "aws_instance" "web_dev" {
  ami           = data.aws_ami.amzlinux2.id
  instance_type = var.instance_type
  key_name      = var.ec2_key
  subnet_id     = var.public_subnets_id

  tags = {
    Name        = "Dev_ec2"
    Environment = var.Environment[1]
  }
}