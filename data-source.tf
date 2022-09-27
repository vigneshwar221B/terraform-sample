data "aws_vpc" "selected" {
  id = module.networking.vpc_id
}

data "aws_subnets" "public_subnets" {
  filter {
    name   = "vpc-id"
    values = [module.networking.vpc_id]
  }

  tags = {
    type        = "public"
    environment = "training"
  }
}

data "aws_subnets" "private_subnets" {
  filter {
    name   = "vpc-id"
    values = [module.networking.vpc_id]
  }

  tags = {
    type        = "private"
    environment = "training"
  }
}

data "aws_db_subnet_group" "rds_subnet" {
  name = module.networking.rds_subnet_name
}
