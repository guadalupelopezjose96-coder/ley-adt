#!/bin/bash
# ==========================================
# 🌀 LANZADOR AURA INTEL v3.5 - 100% LEGAL
# ==========================================

echo "🚀 Iniciando Imperio Aura Intel Core..."

# 1. Limpieza de Justicia (v)
# Libera el puerto 8080 y detiene procesos previos
pkill -9 python; pkill -9 python3
fuser -k 8080/tcp > /dev/null 2>&1 
echo "✅ Memoria, Puerto 8080 y Audio liberados al 100%."

# 2. Servidor del Visor Neón (Puerto 8080)
# Servidor web para la interfaz de abundancia
python3 -m http.server 8080 & 
echo "🌐 Visor listo en http://localhost:8080/view_aura.html"

# 3. Activación del Tetrax Engine
echo "🔊 Activando Geometría del Sonido..."
python3 main.py
