#!/bin/bash

# Función para mostrar la ayuda
function mostrar_ayuda() {
    echo "Uso: ./auto_shutdown.sh -t <tiempo> -u <unidad> -a <acción>"
    echo "Opciones:"
    echo "  -t, --time       Tiempo para programar (obligatorio)"
    echo "  -s, --seconds    Especifica el tiempo en segundos"
    echo "  -m, --minutes    Especifica el tiempo en minutos (por defecto)"
    echo "  -h, --hours      Especifica el tiempo en horas"
    echo "  -a, --apagado    Apaga el PC"
    echo "  -s, --suspender  Suspende el PC"
    echo "  -h, --hibernar   Hiberna el PC"
    echo "  -H, --help       Muestra esta ayuda"
}

# Variables iniciales
unidad="m"
accion=""

# Procesar argumentos
while [[ "$#" -gt 0 ]]; do
    case $1 in
        -t|--time) tiempo="$2"; shift ;;
        -s|--seconds) unidad="s" ;;
        -m|--minutes) unidad="m" ;;
        -h|--hours) unidad="h" ;;
        -a|--apagado) accion="apagado" ;;
        -H|--hibernar) accion="hibernar" ;;
        -s|--suspender) accion="suspender" ;;
        --help) mostrar_ayuda; exit 0 ;;
        *) echo "Opción desconocida: $1"; mostrar_ayuda; exit 1 ;;
    esac
    shift
done

# Validar que el tiempo y la acción han sido proporcionados
if [[ -z "$tiempo" || -z "$accion" ]]; then
    echo "Error: El tiempo y la acción son obligatorios."
    mostrar_ayuda
    exit 1
fi

# Convertir el tiempo a segundos
case $unidad in
    s) segundos=$tiempo ;;
    m) segundos=$((tiempo * 60)) ;;
    h) segundos=$((tiempo * 3600)) ;;
esac

# Mostrar mensaje de confirmación
echo "El sistema se $accion en $tiempo $unidad."

# Contador regresivo
while [ $segundos -gt 0 ]; do
    horas=$((segundos / 3600))
    minutos=$(( (segundos % 3600) / 60 ))
    seg=$((segundos % 60))
    printf "\rTiempo restante: %02d:%02d:%02d" $horas $minutos $seg
    sleep 1
    segundos=$((segundos - 1))
done
echo ""

# Ejecutar la acción
case $accion in
    apagado) sudo shutdown -h now ;;
    hibernar) sudo systemctl hibernate ;;
    suspender) sudo systemctl suspend ;;
esac
