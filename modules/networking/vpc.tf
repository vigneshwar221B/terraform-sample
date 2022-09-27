resource "aws_vpc" "mod_main" {
  cidr_block       = var.cidr
  instance_tenancy = "default"

  tags = {
    Name        = "main-vpc"
    environment = "training"
  }
}
