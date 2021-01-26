-- Base de datos: seguros
CREATE DATABASE seguros OWNER dbo_daw1_a;

-- Tabla: cliente
CREATE TABLE cliente (
    id SMALLINT CONSTRAINT cliente_pk PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    fecha_permiso DATE NOT NULL
);

-- Tabla: vehiculo
CREATE TABLE vehiculo (
    id SMALLINT CONSTRAINT vehiculo_pk PRIMARY KEY,
    num_bastidor NUMERIC(17) NOT NULL,
    matricula CHAR(7) NOT NULL,
    modelo VARCHAR(20) NOT NULL,
    CONSTRAINT vehiculo_num_bastidor_ux UNIQUE (num_bastidor)
);

-- Tabla: accidente
CREATE TABLE accidente (
    id SMALLINT CONSTRAINT accidente_pk PRIMARY KEY,
    num_parte NUMERIC(6) NOT NULL,
    fecha_siniestro DATE NOT NULL,
    localidad VARCHAR(50) NOT NULL
);

-- Tabla: asegura (relacion N:M entre cliente y vehiculo)
CREATE TABLE cliente_vehiculo_asegura (
    cliente_id SMALLINT NOT NULL,
    vehiculo_id SMALLINT NOT NULL,
    CONSTRAINT cliente_vehiculo_asegura_pk PRIMARY KEY (cliente_id, vehiculo_id),
    CONSTRAINT cliente_vehiculo_asegura_cliente_id_fk FOREIGN KEY (cliente_id) 
        REFERENCES cliente(id),
    CONSTRAINT cliente_vehiculo_asegura_vehiculo_id_fk FOREIGN KEY (vehiculo_id) 
        REFERENCES vehiculo(id)
);

-- Tabla: registra (relacion N:M entre cliente y accidente)
CREATE TABLE cliente_accidente_registra (
    cliente_id SMALLINT NOT NULL,
    accidente_id SMALLINT NOT NULL,
    CONSTRAINT cliente_accidente_registra_pk PRIMARY KEY (cliente_id, accidente_id),
    CONSTRAINT cliente_accidente_registra_cliente_id_fk FOREIGN KEY (cliente_id) 
        REFERENCES cliente(id),
    CONSTRAINT cliente_accidente_registra_accidente_id_fk FOREIGN KEY (accidente_id) 
        REFERENCES accidente(id)
);