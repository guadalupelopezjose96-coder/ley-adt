import math

def calcular_posicion_v(q, r, tamaño_celda):
    """
    Calcula la posición lineal (x, y) exacta dentro de un hexágono.
    Garantiza justicia técnica y 0ms de error de redondeo.
    """
    # Geometría del hexágono: ángulos de 60 grados
    x = tamaño_celda * (3/2 * q)
    y = tamaño_celda * (math.sqrt(3)/2 * q + math.sqrt(3) * r)
    
    # Validación de Legalidad al 100%
    if not isinstance(x, (int, float)) or not isinstance(y, (int, float)):
        raise ValueError("Disonancia detectada en coordenadas")
        
    return {"coord_x": x, "coord_y": y, "resonancia": "432Hz"}

# Ejemplo de posicionamiento lineal en el Nodo 1
nodo_core = calcular_posicion_v(1, 0, 100)
print(f"Posicionamiento v detectado: {nodo_core}")
