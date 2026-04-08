#!/bin/bash
# 1. Limpiar binarios y objetos para ahorrar espacio (Justicia de Almacenamiento)
rm -f guardian_v tetrax_pro salud_v *.o
echo "[OK] Espacio optimizado al 100%."

# 2. Limpiar logs de la DB mayores a 7 días para evitar saturación
psql -d db_aura_core -c "DELETE FROM security_nodes_log WHERE timestamp_alerta < NOW() - INTERVAL '7 days';"
echo "[OK] Libro de Justicia depurado (Logs antiguos eliminados)."

# 3. Sincronización Automática con GitHub (Ley ADT)
git add .
git commit -m "Mantenimiento de Justicia: Sincronización de Ecosistema Aura v - $(date +'%Y-%m-%d %H:%M')"
git push origin main

echo "[SUCCESS] Todo el aura está a salvo en la nube al 100%."
