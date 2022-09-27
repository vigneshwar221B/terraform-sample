// subnets
resource "aws_subnet" "pub_subnets" {
  vpc_id            = aws_vpc.mod_main.id
  count             = length(var.public_subnets[*].cidr)
  cidr_block        = var.public_subnets[count.index].cidr
  availability_zone = var.public_subnets[count.index].az

  tags = {
    Name        = var.public_subnets[count.index].name
    type        = "public"
    environment = "training"
  }
}

resource "aws_subnet" "prv_subnets" {
  vpc_id            = aws_vpc.mod_main.id
  count             = length(var.private_subnets[*].cidr)
  cidr_block        = var.private_subnets[count.index].cidr
  availability_zone = var.private_subnets[count.index].az

  tags = {
    Name        = var.private_subnets[count.index].name
    type        = "private"
    environment = "training"
  }
}

resource "aws_db_subnet_group" "mod_db_subnet" {
  name       = "rds_subnet_group"
  subnet_ids = aws_subnet.prv_subnets[*].id
}

//routes

resource "aws_route_table" "mod_public_rt" {
  vpc_id = aws_vpc.mod_main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.mod_main_igw.id
  }

  tags = {
    Name = "mod_main_public_rt"
  }
}

resource "aws_route_table" "mod_private_rt" {
  vpc_id = aws_vpc.mod_main.id

  tags = {
    Name = "mod_main_private_rt"
  }
}

//associations

resource "aws_route_table_association" "mod_main_public_rt_association" {
  count          = length(aws_subnet.pub_subnets[*].id)
  subnet_id      = aws_subnet.pub_subnets[count.index].id
  route_table_id = aws_route_table.mod_public_rt.id
}


resource "aws_route_table_association" "mod_main_private_rt_association" {
  count          = length(aws_subnet.prv_subnets[*].id)
  subnet_id      = aws_subnet.prv_subnets[count.index].id
  route_table_id = aws_route_table.mod_private_rt.id
}
