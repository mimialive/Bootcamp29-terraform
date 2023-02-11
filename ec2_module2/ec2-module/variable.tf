
variable "instance_type" {
  description = "Instance Type"
  type        = string
  default     = "t3.micro"
}

variable "ec2_key" {
  description = "Keypair"
  type        = string
  default     = "Class29Key2"
}

variable "Environment" {
  description = "Environment"
  type        = list(string)
  default     = ["Prod", "Dev"]
}

variable "public_subnets_id" {
  type    = string
  default = "subnet-02b2480b0044f366b"
}

variable "private_subnets_id" {
  type    = string
  default = "subnet-08a2b88c1b1ae6cc2"
}
