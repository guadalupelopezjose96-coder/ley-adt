#!/bin/bash
# Crear directorio de evidencia legal
mkdir -p evidencia

# Mover capturas de pantalla para limpiar el núcleo de trabajo
mv *.jpg evidencia/ 2>/dev/null

# Comprimir evidencia para optimizar almacenamiento
tar -czvf evidencia_ley_adt_$(date +%F).tar.gz evidencia/

echo "[OK] Evidencia organizada y comprimida al 100%."
