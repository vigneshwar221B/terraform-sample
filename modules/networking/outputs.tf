output "vpc_id" {
  value = aws_vpc.mod_main.id
}

output "public_subnets" {
  value = aws_subnet.pub_subnets
}

output "private_subnets" {
  value = aws_subnet.prv_subnets
}

output "rds_subnet_name" {
  value = aws_db_subnet_group.mod_db_subnet.name
}
