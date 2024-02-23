# Actividad 3 - Systemd Unit
Angel David Torcelli Barrios - 201801169

1. Script
```bash
#!/bin/bash
while true; do
    echo "Saludo. Fecha actual: $(date)"
    sleep 1
done
```

2. systemd unit file
Este archivo se creó en el directorio /etc/systemd/system/
La ruta ExecStart varía dependiendo la ubicación del script creado.
```bash
[Unit]
Description=Servicio de saludo y fecha actividad3

[Service]
ExecStart=/home/angelt/Documentos/SistemasOperativos/so1_actividades_201801169/actividad3/script.sh
Restart=always
RestartSec=1

[Install]
WantedBy=default.target
```
La instrucción WantedBy=default.target garantiza que el servicio se activa automáticamente al iniciar el sistema.


3. Para habilitar y crear el servicio
Estando en el directorio /etc/systemd/system/ utilizar los comandos
```bash
sudo systemctl enable saludo.service
sudo systemctl start saludo.service
```

4. Para verificar los log del servicio
```bash
journalctl -u saludo.service
```
5. Para deshabilitar el servicio
```bash
sudo systemctl stop saludo.service
sudo systemctl disable saludo.service
``````