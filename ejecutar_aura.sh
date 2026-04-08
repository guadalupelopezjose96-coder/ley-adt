#!/bin/bash
# Limpiar binarios antiguos para ahorrar espacio
rm -f guardian_v

# Compilación de alta eficiencia
clang++ -O3 -I$PREFIX/include seguridad_v.cpp -o guardian_v -L$PREFIX/lib -lpq

if [ $? -eq 0 ]; then
    echo "Compilación exitosa al 100%."
    ./guardian_v
    # Verificación inmediata en la DB
    psql -d db_aura_core -c "SELECT * FROM security_nodes_log ORDER BY timestamp_alerta DESC LIMIT 1;"
else
    echo "Error en la construcción del Escudo."
fi
