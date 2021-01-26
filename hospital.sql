CREATE TABLE planta (
id NUMERIC(2) CONSTRAINT planta_pk PRIMARY KEY,
nombre VARCHAR(20) NOT NULL );

CREATE TABLE sala (
id NUMERIC(4) CONSTRAINT sala_pk PRIMARY KEY,
planta_id NUMERIC(2),
nombre VARCHAR(20) NOT NULL,
num_camas INT,
CONSTRAINT sala_planta_id_fk FOREIGN KEY (planta_id) REFERENCES planta(id));

CREATE TABLE paciente (
id NUMERIC(9) CONSTRAINT paciente_pk PRIMARY KEY,
sala_id NUMERIC(4) NOT NULL,
num_registro NUMERIC(9) NOT NULL,
nombre VARCHAR(100) NOT NULL,
CONSTRAINT paciente_sala_id_fk FOREIGN KEY (sala_id) REFERENCES sala(id));

CREATE TABLE empleado (
id NUMERIC(5) CONSTRAINT empleado_pk PRIMARY KEY,
sala_id NUMERIC(4) NOT NULL,
num_empleado NUMERIC(5) NOT NULL,
nombre VARCHAR(100) NOT NULL,
direccion VARCHAR(50),
telefono CHAR(9),
CONSTRAINT empleado_sala_id_fk FOREIGN KEY (sala_id) REFERENCES sala(id));