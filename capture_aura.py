import sounddevice as sd
import numpy as np

FS = 44100  # Frecuencia de muestreo

def procesar_recepciuvn(indata, frames, time, status):
    if status:
        print(f"⚠️ Status: {status}")
    volumen = np.linalg.norm(indata) * 10
    # Actualiza el aura neón según el volumen
    with open('volumen.txt', 'w') as v:
        v.write(str(volumen))

def iniciar_captura():
    try:
        # Configuración monocanal para evitar sobrecarga en Galaxy A16
        with sd.InputStream(channels=1, callback=procesar_recepciuvn, samplerate=FS):
            print("💎 Radar Aura Intel Core escuchando...")
            while True:
                sd.sleep(1000)
    except Exception as e:
        print(f"❌ Error Crítico: {e}")

if __name__ == "__main__":
    iniciar_captura()
