module "networking" {
  source = "./modules/networking"

  cidr            = "10.0.0.0/16"
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
}

module "rds_instance" {
  source = "./modules/rds"

  allocated_storage    = 10
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t3.micro"
  db_name              = "mydb"
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true

  rds_user     = var.rds_user
  rds_password = var.rds_password

  rds_subnet_name = data.aws_db_subnet_group.rds_subnet.name
  vpc_id          = data.aws_vpc.selected.id
}

module "ec2_instances" {
  source = "./modules/ec2"

  ec2_count = 2
  ec2_name  = "web_server"
  ec2_type  = "t3.micro"
  ec2_ami   = "ami-079ca844e323047c2"

  vpc_id             = data.aws_vpc.selected.id
  public_subnet_ids  = data.aws_subnets.public_subnets.ids
  private_subnet_ids = data.aws_subnets.private_subnets.ids

  rds_user     = var.rds_user
  rds_password = var.rds_password
  rds_endpoint = module.rds_instance.rds_endpoint
}
