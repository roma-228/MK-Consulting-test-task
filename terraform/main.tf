resource "aws_instance" "web_server" {
  ami           = "ami-0a7d80731ae1b2435"
  instance_type = var.instance_type
  key_name      = aws_key_pair.deployer.key_name
  security_groups = [aws_security_group.web_sg.name]

  tags = {
    Name = "DevOpsTestWebServer"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update",
      "sudo apt-get install -y python3"
    ]

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = tls_private_key.deployer.private_key_pem
      host        = self.public_ip
    }
  }
}
