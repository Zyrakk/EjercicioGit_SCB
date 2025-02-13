# Keylogger en Bash - Proyecto Educativo

## Descripción
Este proyecto implementa un keylogger en **Bash** capaz de registrar pulsaciones de teclado y enviarlas a un servidor remoto. El objetivo es aprender sobre **seguridad informática**, gestión de eventos en Linux y la recopilación de datos de entrada de teclado para análisis.

## Características
- Captura de pulsaciones de teclado en Linux.
- Registro de teclas en un archivo de texto (`keylog.txt`).
- Registro del usuario y la ip de la maquina víctima.
- Envío automático de logs a un servidor remoto.
- Autodestrucción después de la ejecución.

## Uso
1. **Ejecutar en un entorno de pruebas** con permisos de root.
2. Configurar un servidor para recibir los archivos (mediante Flask o Apache).
3. Instalar dependencias necesarias:
   ```bash
   sudo apt install evtest
   ```
4. Ejecutar el script:
   ```bash
   sudo ./keylogger.sh
   ```

## Uso del socat
- Dar permisos a los scripts:
    ```bash
    chmod +x start_socat.sh stop_socat.sh
    ```
- Iniciar socat:
    ```bash
    ./start_socat.sh
    ```
- Detener socat:
    ```bash
    ./stop_socat.sh
    ```

## Advertencia ⚠️
**Este código es exclusivamente para fines educativos.** No debe usarse en entornos reales sin consentimiento. El uso indebido de esta herramienta puede ser ilegal y está prohibido sin autorización.

## Notas
Este proyecto fue desarrollado para propósitos académicos dentro de una práctica de gestión de versiones con GitHub.
