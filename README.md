# NGINX con TERRAFORM

Este proyecto despliega un servidor NGINX en AWS utilizando Terraform. La configuración incluye la creación de una instancia EC2, un par de claves SSH y un grupo de seguridad que permite el acceso SSH y HTTP.

## Prerrequisitos

Antes de comenzar, asegúrate de tener instalados los siguientes programas:

- [Terraform](https://www.terraform.io/downloads.html)
- [AWS CLI](https://aws.amazon.com/cli/)
- Una cuenta de AWS con credenciales configuradas

## Paso 1: Inicializar el Proyecto

Inicializa el proyecto de Terraform para descargar los proveedores necesarios:

```bash
terraform init
```
## Paso 2: Configurar las Claves SSH
* Crear un Par de Claves SSH
* Si no tienes un par de claves SSH, puedes crear uno utilizando el siguiente comando:
```bash
ssh-keygen -t rsa -b 2048 -f nginx-server.key
```
Esto generará dos archivos:

* nginx-server.key (clave privada)
* nginx-server.key.pub (clave pública)
- Asegúrate de mantener la clave privada segura.
## Paso 3: Planificar y Aplicar la Configuración
### Planificar
Revisa el plan de ejecución para asegurarte de que Terraform va a crear los recursos correctos:
```
terraform plan
```
### Aplicar
Aplica la configuración para crear los recursos en AWS:
```
terraform apply
```
Cuando se te pida confirmación, escribe yes para proceder.
## Paso 4: Conectar al Servidor NGINX
Una vez que la aplicación haya terminado, puedes obtener la dirección IP pública de tu instancia EC2 utilizando el siguiente comando:
```
terraform output public_ip
```
Utiliza la IP pública para conectarte a tu servidor NGINX a través de SSH:
```
ssh -i nginx-server.key ec2-user@<public_ip>
```
Y también puedes acceder al servidor NGINX a través de tu navegador web ingresando la IP pública.

### Limpieza
Para destruir los recursos creados por Terraform, utiliza el siguiente comando:
```
terraform destroy
```
Cuando se te pida confirmación, escribe yes para proceder.
