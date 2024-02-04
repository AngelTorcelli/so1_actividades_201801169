#!/bin/bash

# Establece la variable de entorno GITHUB_USER
export GITHUB_USER="AngelTorcelli"

# Consultar la GitHub API
JSON_RESPONSE=$(curl -s "https://api.github.com/users/${GITHUB_USER}")

# Extracción de la información del usuario
USER_ID=$(jq -r '.id' <<< "$JSON_RESPONSE")
CREATED_AT=$(jq -r '.created_at' <<< "$JSON_RESPONSE")

# Imprime el mensaje
echo "Hola $GITHUB_USER. User ID: $USER_ID. Cuenta fue creada el: $CREATED_AT."

# Creación de un log file en /tmp/<fecha>/saludos.log
LOG_DIR="/tmp/$(date +'%Y%m%d')"
LOG_FILE="${LOG_DIR}/saludos.log"

# Crea el directorio si no existe
mkdir -p "$LOG_DIR"

# Escritura del log saludos.log
echo "$(date +'%Y-%m-%d %H:%M:%S') - Hola $GITHUB_USER. User ID: $USER_ID. Cuenta fue creada el: $CREATED_AT." >> "$LOG_FILE"

# Contrab para ejecutar el archivo script cada 5 minutos
# */5 * * * * /ruta/script.sh

