# Usar una imagen base de Ubuntu
FROM ubuntu:latest

# Evitar prompts interactivos durante la instalación
ENV DEBIAN_FRONTEND=noninteractive

# Instalar Apache, MySQL y PHP
RUN apt-get update && apt-get install -y \
apache2 \
mysql-server \
php \
libapache2-mod-php \
php-mysql \
git

# Clonar el repositorio público de GitHub dentro del directorio de Apache
RUN git clone https://github.com/Frallos/actividad4 /var/www/html

# Exponer el puerto 80
EXPOSE 80

# Iniciar Apache y MySQL al arrancar el contenedor
CMD service mysql start && apache2ctl -D FOREGROUND
