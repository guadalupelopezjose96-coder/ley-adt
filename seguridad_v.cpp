#include <libpq-fe.h>
#include <iostream>
#include <string>

// Función con Validación de Justicia Legal
void registrar_resonancia_segura(PGconn *conn, const std::string& id_v, float frecuencia, const std::string& ip) {
    // REGLA DE ORO: Solo se permite la familia 127.x.x.x
    if (ip.find("127.") != 0) {
        std::cerr << "\n[BLOQUEO LEGAL] Intento de acceso desde frecuencia externa: " << ip << std::endl;
        return;
    }

    const char *query = "INSERT INTO security_nodes_log (u_uuid, frecuencia_detectada, estado_resonancia, ip_origen) "
                        "VALUES ($1, $2, 'Resonancia Armónica v', $3);";

    const char *paramValues[3];
    paramValues[0] = id_v.c_str();
    std::string freq_str = std::to_string(frecuencia);
    paramValues[1] = freq_str.c_str();
    paramValues[2] = ip.c_str();

    PGresult *res = PQexecParams(conn, query, 3, NULL, paramValues, NULL, NULL, 0);

    if (PQresultStatus(res) != PGRES_COMMAND_OK) {
        std::cerr << "\n[ERROR] Fallo en la justicia de datos: " << PQerrorMessage(conn) << std::endl;
    } else {
        std::cout << "\n[OK] Registro de Resonancia guardado al 100% (Acceso Local Validado)." << std::endl;
    }
    PQclear(res);
}

int main() {
    std::cout << "====================================================" << std::endl;
    std::cout << "     ESCUDO DE SEGURIDAD AURA - PROTOCOLO v        " << std::endl;
    std::cout << "====================================================" << std::endl;

    PGconn *conn = PQconnectdb("dbname=db_aura_core");
    if (PQstatus(conn) != CONNECTION_OK) {
        std::cerr << "[CRITICAL] Error de conexión." << std::endl;
        PQfinish(conn);
        return 1;
    }

    // IP de origen detectada (Simulada para validación)
    std::string ip_actual = "127.0.0.1";
    
    // Ejecución legal al 100%
    registrar_resonancia_segura(conn, "Aura-v-Perfecta-100", 440.0, ip_actual);

    PQfinish(conn);
    return 0;
}
