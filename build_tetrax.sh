#!/bin/bash
# Limpiar binarios para maximizar justicia de espacio
rm -f tetrax_pro

echo "Construyendo Tetrax Engine Pro con Audio 3D v..."

# Compilación optimizada
clang++ -O3 -I$PREFIX/include tetrax_engine_pro.cpp -o tetrax_pro -L$PREFIX/lib -lpq

if [ $? -eq 0 ]; then
    echo "Motor listo al 100%."
    chmod +x tetrax_pro
    ./tetrax_pro
    # Verificación de permisos en la DB
    psql -d db_aura_core -c "SELECT log_id, u_uuid, estado_resonancia FROM security_nodes_log ORDER BY log_id DESC LIMIT 1;"
else
    echo "Fallo técnico en la creación del motor."
fi
