# Usa una imagen base oficial de Ubuntu
FROM ubuntu:latest

# Instala Samba
RUN apt-get update && \
    apt-get install -y samba && \
    apt-get clean

# Crea un directorio para los compartidos de Samba
RUN mkdir -p /srv/samba/shared

# Copia el archivo de configuración smb.conf desde el host al contenedor
# Esto no es necesario si estás montando el archivo como volumen

# Expon los puertos necesarios para Samba
EXPOSE 137 138 139 445

# Comando para iniciar Samba
CMD ["smbd", "-F", "--no-process-group"]
