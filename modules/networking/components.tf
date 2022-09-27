// networking components

resource "aws_internet_gateway" "mod_main_igw" {
  vpc_id = aws_vpc.mod_main.id

  tags = {
    Name        = "mod-main-igw"
    environment = "training"
  }
}
