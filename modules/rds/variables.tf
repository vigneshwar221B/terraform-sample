variable "rds_user" {
  description = "initial username for rds user"
  default     = "root"
}

variable "rds_password" {
  description = "initial password for rds user"
}

variable "allowed_cidr_blocks" {
  description = "allowed cidr blocks"
  default     = ["0.0.0.0/0"]
}

variable "rds_port" {
  description = "port needed for ur rds db engine"
  default     = 3306
}

variable "rds_subnet_name" {
  description = "subnet name for rds"
}

variable "vpc_id" {
  description = "vpc for rds"
}

variable "engine" {
  description = "db engine for rds"
}

variable "engine_version" {
  description = "db engine version"
}

variable "instance_class" {
  description = "db instance type"
}

variable "db_name" {
  description = "initial db name"
}

variable "parameter_group_name" {
  description = "param group name for rds"
}

variable "allocated_storage" {
  description = "allocated storage for rds"
}

variable "skip_final_snapshot" {
  description = "bool for whether to skip final snapshot"
}
