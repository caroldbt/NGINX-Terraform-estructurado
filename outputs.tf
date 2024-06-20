# Mostrar información resultante de la infraestructura
output "public_ip" {
  description = "Dirección IP publica de la instancia EC2"
  value       = aws_instance.nginx-server.public_ip
}

# Mostrar información resultante de la infraestructura
output "public_dns" {
  description = "DNS publico de la instancia EC2"
  value       = aws_instance.nginx-server.public_dns
}