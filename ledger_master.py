import datetime, hashlib
def registrar():
    datos = f"{datetime.datetime.now()}|528Hz|7500.00"
    firma = hashlib.sha256(datos.encode()).hexdigest()[:16]
    with open("ledger_barter.txt", "a") as f:
        f.write(f"PROCESADO: {datos} | FIRMA: {firma}\n")
    print("💰 [BARTER] $7,500 registrados al 100%.")
if __name__ == "__main__": registrar()
