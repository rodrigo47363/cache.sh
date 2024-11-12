# Cache Cleaner Script

Este repositorio contiene un script en Bash diseñado para liberar la memoria caché de Linux usando `sync` y el ajuste de `drop_caches` en modo 3. Este script también verifica si está disponible en el sistema, y si no, lo descarga automáticamente desde un repositorio.

## Características

- **Liberación de memoria caché**: Utiliza `echo 3 > /proc/sys/vm/drop_caches` para vaciar la caché de páginas, inodos y dentries.
- **Sincronización de memoria**: Utiliza `sync` para sincronizar la memoria antes de liberar la caché.
- **Auto-verificación y descarga**: Descarga el script desde un repositorio remoto si no está presente en el sistema.
- **Compatibilidad con sistemas Linux**.

## Requisitos

- **Linux**: Este script es compatible únicamente con sistemas Linux.
- **Permisos de root**: Requiere permisos de root para modificar `/proc/sys/vm/drop_caches`.
- **Conexión a Internet**: Necesaria solo para descargar el script si no está presente en el sistema.

## Instalación

1. Clona este repositorio o descarga el script `cache.sh` en tu sistema:

   ```bash
   git clone https://github.com/rodrigo47363/cache.sh.git
   cd cache.sh
   ```

2. Asegúrate de que el archivo `cache.sh` tenga permisos de ejecución:

   ```bash
   chmod +x cache.sh
   ```

3. Si deseas instalar el script en `/usr/local/bin` para acceder desde cualquier ubicación, ejecuta:

   ```bash
   sudo cp cache.sh /usr/local/bin/
   ```

## Uso

Para ejecutar el script y liberar la caché, abre una terminal y ejecuta:

```bash
sudo ./cache.sh
```

Este script realiza las siguientes acciones:

1. Verifica si el archivo `cache.sh` está disponible localmente en `/usr/local/bin`.
2. Si no está, lo descarga desde el repositorio y lo configura en el sistema.
3. Ejecuta la función `limpiar_cache` para sincronizar y vaciar la caché del sistema.

### Ejemplo de Salida

```bash
$ sudo ./cache.sh
Liberando memoria...
Memoria liberada con éxito.
```

## Explicación del Código

El script incluye las siguientes secciones:

- **Verificación y descarga del script**: Comprueba si el script `cache.sh` está en el sistema; si no, lo descarga desde el repositorio configurado en `REPO_URL`.
- **Liberación de caché**: Utiliza `sync` seguido de `echo 3 > /proc/sys/vm/drop_caches` para vaciar la memoria y muestra mensajes de confirmación o error.

## Personalización

Si necesitas cambiar la URL de descarga o el nombre del archivo, puedes modificar las variables `REPO_URL` y `SCRIPT_NAME` en el código.

## Contribuciones

Las contribuciones son bienvenidas. Si encuentras algún error o tienes sugerencias para mejorar el script, abre un issue o envía un pull request.

## Licencia

Este proyecto está bajo la licencia MIT. Puedes consultar los términos completos en el archivo [LICENSE](LICENSE) para más detalles.
