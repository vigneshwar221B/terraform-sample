resource "aws_db_instance" "mod_rds" {
  allocated_storage      = var.allocated_storage
  engine                 = var.engine
  engine_version         = var.engine_version
  instance_class         = var.instance_class
  db_name                = var.db_name
  username               = var.rds_user
  password               = var.rds_password
  parameter_group_name   = var.parameter_group_name
  skip_final_snapshot    = var.skip_final_snapshot
  db_subnet_group_name   = var.rds_subnet_name
  vpc_security_group_ids = [aws_security_group.mod_rds_sg.id]

  provisioner "local-exec" {
    //command = "echo ${var.rds-password} > scripts/password.txt"
    command = <<EOF
     echo ${var.rds_password} > files/password.txt
     echo ${var.rds_user} > files/username.txt
     echo ${self.endpoint} > files/endpoint.txt
     EOF
  }
}
