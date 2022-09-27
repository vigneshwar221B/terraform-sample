# locals {
#   subnet_index = length(var.public-subnet-ids) % var.ec2-count
# }

resource "aws_instance" "mod_web" {
  ami                         = var.ec2_ami
  instance_type               = var.ec2_type
  subnet_id                   = var.public_subnet_ids[(count.index + 1) % length(var.public_subnet_ids)]
  key_name                    = local.key_pair_name
  vpc_security_group_ids      = [aws_security_group.mod_web_sg.id]
  associate_public_ip_address = true
  count                       = var.ec2_count

  tags = {
    Name = "${var.ec2_name}-${count.index}"
  }

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("${path.module}/keys/${local.key_pair_name}.pem")
    host        = self.public_ip
  }

  provisioner "file" {
    source      = "php/index.php"
    destination = "/home/ubuntu/index.php"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get -y update",
      "sudo apt-get -y upgrade",

      "sudo apt-get install -y apache2",
      "sudo apt-get install -y php",
      "sudo apt-get install -y mysql-server",
      "sudo apt-get install -y php-mysql",

      "sudo service apache2 restart",
      "sudo cp ~/index.php /var/www/html/index.php"
    ]
  }

  provisioner "file" {
    source      = "files/endpoint.txt"
    destination = "/home/ubuntu/endpoint.txt"
  }
  provisioner "file" {
    source      = "files/password.txt"
    destination = "/home/ubuntu/password.txt"
  }
  provisioner "file" {
    source      = "files/username.txt"
    destination = "/home/ubuntu/username.txt"
  }
}
