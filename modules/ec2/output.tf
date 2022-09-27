output "alb_dns" {
  value = aws_alb.mod_web_alb.dns_name
}

output "ec2_instances" {
  value = aws_instance.mod_web[*].id
}
