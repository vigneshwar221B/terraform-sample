output "vpc" {
  value = module.networking.vpc_id
}

output "pub_subnets" {
  value = module.networking.public_subnets
}

output "prv_subnets" {
  value = module.networking.private_subnets
}

output "ec2_instances" {
  value = module.ec2_instances.ec2_instances
}
output "rds_endpoint" {
  value       = module.rds_instance.rds_endpoint
  description = "RDS endpoint to connect to"
}

output "alb_dns_name" {
  value       = module.ec2_instances.alb_dns
  description = "public dns for the ALB"
}

