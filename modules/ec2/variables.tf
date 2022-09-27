variable "ec2_count" {
  description = "number of ec2 instances"
  default     = 2
}

variable "ec2_name" {
  description = "name of ec2"
  default     = "web"
}

variable "ec2_type" {
  description = "type of ec2 instance"
  default     = "t3.micro"
}

variable "ec2_ami" {
  description = "ami for the ec2 instances"
  default     = "ami-052efd3df9dad4825"
}

variable "ec2_tag" {
  description = "value"
  default = {
    by : "vignes"
  }
}

variable "all_access_cidr_blocks" {
  default = ["0.0.0.0/0"]
}

variable "my_ip" {
  default     = "122.187.88.146/32"
  description = "cidr block for vpc/subnets/sg"
}

variable "vpc_id" {
  description = "vpc id for ec2s"
}
variable "public_subnet_ids" {
  description = "list of public subnet ids"
}
variable "private_subnet_ids" {
  description = "list of private subnet ids"
}

variable "rds_user" {
  description = "initial username for rds user"
}
variable "rds_password" {
  description = "initial password for rds user"
}
variable "rds_endpoint" {
  description = "rds endpoint for ec2s to connect to"
}
