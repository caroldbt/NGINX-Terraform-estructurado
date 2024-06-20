##  ssh keys de nginx
resource "aws_key_pair" "nginx-server-ssh" {
  key_name = "${var.server_name}-ssh"
  #subimos nuestra llave en aws 
  public_key = file("${var.server_name}.key.pub")
  # Tags
  tags = {
    Name        = "${var.server_name}-ssh"
    Environment = "${var.environment}"
    Owner       = "tu nombre o email"
    Team        = "DevOps"
    Project     = "terraform-nginx"
  }
}
