-- Base de datos: municipios
CREATE DATABASE municipios OWNER dbo_daw1_a;

-- Tabla: municipio
CREATE TABLE municipio (
    id SMALLINT CONSTRAINT municipio_pk PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);

-- Tabla: vivienda
CREATE TABLE vivienda (
    id SMALLINT CONSTRAINT vivienda_pk PRIMARY KEY,
    calle VARCHAR(50) NOT NULL,
    numero CHAR(3),
    piso CHAR(2),
    letra CHAR(1)
);

-- Tabla: persona
-- Observar que es una relación reflexiva. 
-- Si la persona no es cabeza de familia en el campo cabeza de familia habrá un NULL
CREATE TABLE persona (
    id SMALLINT CONSTRAINT persona_pk PRIMARY KEY,
    dni CHAR(9) NOT NULL,
    persona_cabeza_familia_id SMALLINT,
    municipio_id SMALLINT NOT NULL,
    vivienda_id SMALLINT NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    CONSTRAINT persona_persona_cabeza_familia_id_fk FOREIGN KEY (persona_cabeza_familia_id) 
        REFERENCES persona(id),
    CONSTRAINT persona_municipio_id_fk FOREIGN KEY (municipio_id) 
        REFERENCES municipio(id),
    CONSTRAINT persona_vivienda_id_fk FOREIGN KEY (vivienda_id) 
        REFERENCES vivienda(id),
    CONSTRAINT persona_dni_ux UNIQUE (dni)
);


-- Tabla: posee (relacion N:M entre persona y vivienda)
CREATE TABLE persona_vivienda_posee (
    persona_id SMALLINT NOT NULL,
    vivienda_id SMALLINT NOT NULL,
    CONSTRAINT persona_vivienda_posee_pk PRIMARY KEY (persona_id, vivienda_id),
    CONSTRAINT persona_vivienda_posee_persona_id_fk FOREIGN KEY (persona_id) 
        REFERENCES persona(id),
    CONSTRAINT persona_vivienda_posee_vivienda_id_fk FOREIGN KEY (vivienda_id) 
        REFERENCES vivienda(id)
);