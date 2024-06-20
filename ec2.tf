
## recursos
resource "aws_instance" "nginx-server" {
  ami           = var.ami_id
  instance_type = var.instance_type

  ## creamos un script de bash, donde instalamos nginx
  user_data = <<-EOF
              #!/bin/bash
              sudo yum install -y nginx
              sudo systemctl enable nginx
              sudo systemctl start nginx
              EOF
  # creamos una varible para hacer referencia a la llave aws_keys_pair de nginx
  key_name               = aws_key_pair.nginx-server-ssh.key_name
  vpc_security_group_ids = [aws_security_group.nginx-server-sg.id]

  # Tags
  tags = {
    Name        = var.server_name
    Environment = var.environment
    Owner       = "tu nombre o email"
    Team        = "DevOps"
    Project     = "terraform-nginx"
  }
}
