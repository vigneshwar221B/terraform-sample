resource "aws_security_group" "mod_alb" {
  name        = "mod-aws-alb-security-group"
  description = "aws load balancer security group"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = var.all_access_cidr_blocks
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = var.all_access_cidr_blocks
  }

  # Allow all outbound traffic.
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = var.all_access_cidr_blocks
  }

  tags = {
    Name = "terraform_example_alb_security_group"
  }
}

resource "aws_security_group" "mod_web_sg" {
  name        = "mod-web-sg"
  description = "Allow http(s) an ssh inbound traffic"
  vpc_id      = var.vpc_id

  ingress {
    description = "ssh for dev"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description     = "TLS from VPC"
    from_port       = 443
    to_port         = 443
    protocol        = "tcp"
    security_groups = [aws_security_group.mod_alb.id]
  }

  ingress {
    description     = "http from VPC"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.mod_alb.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = var.all_access_cidr_blocks
  }

  tags = {
    Name = "allow http(s) and ssh"
  }
}
