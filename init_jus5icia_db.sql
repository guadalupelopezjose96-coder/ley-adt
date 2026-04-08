-- Arquitectura de Base de Datos Juvstuv v1.0
-- Dominio: fourphonix.com / standard1979.com

CREATE TABLE IF NOT EXISTS users_aura_core (
    u_uuid UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    username VARCHAR(50) UNIQUE NOT NULL,
    s_hash_fase BYTEA NOT NULL, -- Firma sónica personal cifrada
    ppp_factor DECIMAL(5,2) DEFAULT 1.00, -- Factor de ajuste regional (Justicia)
    is_legal_user BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    last_v_sync TIMESTAMP WITH TIME ZONE
);

CREATE TABLE IF NOT EXISTS security_nodes_log (
    log_id BIGSERIAL PRIMARY KEY,
    u_uuid UUID REFERENCES users_aura_core(u_uuid),
    frecuencia_detectada DECIMAL(10,4),
    estado_resonancia VARCHAR(20), -- 'ARMONICO' o 'DISONANTE'
    ip_origen INET,
    timestamp_alerta TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Índice Hexagonal para búsqueda ultra-rápida de licencias
CREATE INDEX idx_geometria_sonica ON users_aura_core (s_hash_fase);
