#include <libpq-fe.h>
#include <iostream>

void registrar_resonancia(PGconn *conn, std::string uuid, float frecuencia) {
    // Sentencia SQL preparada para máxima seguridad (Anti-SQL Injection)
    const char *query = "INSERT INTO security_nodes_log (u_uuid, frecuencia_detectada, estado_resonancia, ip_origen) "
                        "VALUES ($1, $2, 'Resonancia Armónica v', '127.0.0.1');";

    const char *paramValues[2];
    paramValues[0] = uuid.c_str();
    std::string freq_str = std::to_string(frecuencia);
    paramValues[1] = freq_str.c_str();

    PGresult *res = PQexecParams(conn, query, 2, NULL, paramValues, NULL, NULL, 0);

    if (PQresultStatus(res) != PGRES_COMMAND_OK) {
        std::cerr << "[ERROR] Fallo en la justicia de datos: " << PQerrorMessage(conn) << std::endl;
    } else {
        std::cout << "[OK] Registro de Resonancia guardado al 100% en db_aura_core." << std::endl;
    }
    PQclear(res);
}
