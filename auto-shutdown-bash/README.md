# AutoShutdown-Bash

AutoShutdown-Bash es un script en Bash que permite programar el apagado, hibernación o suspensión automática de un sistema Linux después de un tiempo determinado. Además, el script incluye un contador regresivo que muestra el tiempo restante antes de ejecutar la acción especificada.

## 🚀 Características

- Programación del apagado, hibernación o suspensión del sistema en segundos, minutos u horas.
- Muestra un contador regresivo en la terminal mientras se ejecuta el tiempo.
- Puede ser cancelado en cualquier momento usando `Ctrl + C`.

## 📋 Requisitos

- Sistema operativo Linux
- Bash Shell
- Permisos de administrador (`sudo`)

## 📦 Instalación

1. Clona este repositorio o descarga el archivo `auto_shutdown.sh`:
   ```bash
   git clone https://github.com/tuusuario/AutoShutdown-Bash.git
   cd AutoShutdown-Bash
   ```

2. Da permisos de ejecución al script:
   ```bash
   chmod +x auto_shutdown.sh
   ```

## 🛠️ Uso

Ejecuta el script desde la terminal con las siguientes opciones:

```bash
./auto_shutdown.sh -t <tiempo> -s|-m|-h -a apagado|hibernar|suspender
```

### Parámetros

- `-t` o `--time`: Tiempo que deseas configurar (obligatorio).
- `-s` o `--seconds`: Define el tiempo en segundos.
- `-m` o `--minutes`: Define el tiempo en minutos (por defecto).
- `-h` o `--hours`: Define el tiempo en horas.
- `-a apagado`: Apaga el PC después del tiempo especificado.
- `-h hibernar`: Hiberna el PC después del tiempo especificado.
- `-s suspender`: Suspende el PC después del tiempo especificado.

### Ejemplos de uso

- Para programar el apagado en 5 minutos:
  ```bash
  ./auto_shutdown.sh -t 5 -m -a apagado
  ```
- Para programar la suspensión en 120 segundos:
  ```bash
  ./auto_shutdown.sh -t 120 -s -a suspender
  ```
- Para programar la hibernación en 1 hora:
  ```bash
  ./auto_shutdown.sh -t 1 -h -H
  ```

### Cancelar la acción
Puedes cancelar el proceso de apagado, hibernación o suspensión presionando `Ctrl + C` en la terminal mientras el script está en ejecución.
