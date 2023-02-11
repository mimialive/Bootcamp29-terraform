provider "aws" {
  region = "us-east-1"

}

module "ec2module" {
  source = "./ec2-module"
}

terraform {
  backend "s3" {
    bucket         = "bootcamp29-23-mimi"
    key            = "terraform/ec2/terraform.tfstate"
    dynamodb_table = "terraform-lock2"

    region = "us-east-1"

  }
}


resource "aws_dynamodb_table" "tf2_lock" {
  name           = "terraform-lock2"
  hash_key       = "LockID"
  read_capacity  = 3
  write_capacity = 3
  attribute {
    name = "LockID"
    type = "S"
  }
  tags = {
    Name = "Terraform Lock Table2"
  }
}