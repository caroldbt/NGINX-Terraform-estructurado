
### SG ###
resource "aws_security_group" "nginx-server-sg" {
  name        = "nginx-server-sg"
  description = "Security group allowing SSH and HTTP access"

  ## Reglas de entrada
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ## Reglas de salida: aceptando todos los puertos
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  # Tags
  tags = {
    Name        = "${var.server_name}-sg"
    Environment = "${var.environment}"
    Owner       = "carol123dbt@gmail.com"
    Team        = "DevOps"
    Project     = "terraform-nginx"
  }
}