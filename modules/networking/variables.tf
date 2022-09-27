variable "cidr" {
  description = "vpc cidr"
  default     = "10.0.0.0/16"
}

variable "public_subnets" {
  description = "public subnets from user"
}

variable "private_subnets" {
  description = "private subnets from user"
}
