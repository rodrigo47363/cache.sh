#!/bin/bash

set -e

REPO_URL="https://github.com/rodrigo47363/cache.sh/raw/main/cache.sh"
SCRIPT_NAME="cache.sh"
LOCAL_PATH="/usr/local/bin/$SCRIPT_NAME"

# Función para vaciar la caché (modo 3)
limpiar_cache() {
  echo "Liberando memoria..."
  # Sincroniza y vacía la caché en modo 3
  if sudo sync && echo 3 | sudo tee /proc/sys/vm/drop_caches > /dev/null; then
    echo "Memoria liberada con éxito."
  else
    echo "Fallo al liberar memoria."
    exit 1
  fi
}

# Verificar si el script está en el sistema, de lo contrario, descargarlo
if [[ ! -f "$LOCAL_PATH" ]]; then
  echo "Descargando $SCRIPT_NAME desde el repositorio..."
  sudo curl -o "$LOCAL_PATH" -L "$REPO_URL"
  sudo chmod +x "$LOCAL_PATH"
  echo "$SCRIPT_NAME descargado y configurado en $LOCAL_PATH."
fi

# Ejecutar la función para limpiar la caché
limpiar_cache

