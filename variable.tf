variable "rds_user" {
  description = "rds username for initial user"
}

variable "rds_password" {
  description = "rds password for initial user"
}

variable "my_ip" {
  default     = "122.187.88.146/32"
  description = "cidr block for vpc/subnets/sg"
}

variable "public_subnets" {
  description = "cidr, az, name of pubic subnets"
  default = [
    {
      name = "pub-1"
      cidr = "10.0.0.0/20"
      az   = "us-east-1a"
    },
    {
      name = "pub-2"
      cidr = "10.0.16.0/20"
      az   = "us-east-1b"
    }
  ]
}

variable "private_subnets" {
  description = "cidr, az, name of private subnets"
  default = [
    {
      name = "prv-1"
      cidr = "10.0.128.0/20"
      az   = "us-east-1a"
    },
    {
      name = "prv-2"
      cidr = "10.0.144.0/20"
      az   = "us-east-1b"
    }
  ]
}
