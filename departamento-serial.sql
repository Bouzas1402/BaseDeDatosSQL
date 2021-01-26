CREATE TABLE departamento (
    id SERIAL CONSTRAINT departamento_pk PRIMARY KEY,
    nombre VARCHAR(20) NOT NULL 
);

CREATE TABLE vehiculo (
    id SERIAL CONSTRAINT vehiculo_pk PRIMARY KEY,
    matricula CHAR(7) NOT NULL,
    nombre VARCHAR(20) NOT NULL 
);

CREATE TABLE proyecto (
    id SERIAL CONSTRAINT proyecto_pk PRIMARY KEY,
    presupuesto NUMERIC(7) NOT NULL 
);

CREATE TABLE empleado (
    id SERIAL CONSTRAINT empleado_pk PRIMARY KEY,
    departamento_id INT NOT NULL,
    dni CHAR(9) NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    direccion VARCHAR(100),
    CONSTRAINT empleado_departamento_id_fk FOREIGN KEY (departamento_id) 
        REFERENCES departamento(id),
    CONSTRAINT empleado_dni_ux UNIQUE (dni) 
);

CREATE TABLE administrativo (
    id SERIAL CONSTRAINT administrativo_pk PRIMARY KEY,
    empleado_id INT NOT NULL, 
    num_idiomas NUMERIC(7) NOT NULL,
    CONSTRAINT administrativo_empleado_id_fk FOREIGN KEY (empleado_id) 
        REFERENCES empleado(id) 
);

CREATE TABLE conductor (
    id SERIAL CONSTRAINT conductor_pk PRIMARY KEY,
    empleado_id INT NOT NULL, 
    num_accidentes SMALLINT NOT NULL,
    num_permiso NUMERIC(7) NOT NULL,
    CONSTRAINT conductor_empleado_id_fk FOREIGN KEY (empleado_id) 
        REFERENCES empleado(id) 
);

CREATE TABLE tecnico (
    id SERIAL CONSTRAINT tecnico_pk PRIMARY KEY,
    empleado_id INT NOT NULL,
    especialidad VARCHAR(50) NOT NULL,
    CONSTRAINT tecnico_empleado_id_fk FOREIGN KEY (empleado_id) 
        REFERENCES empleado(id) 
);

CREATE TABLE vehiculo_conductor_conduce (
    id SERIAL CONSTRAINT vehiculo_conductor_conduce_pk PRIMARY KEY,
    vehiculo_id INT NOT NULL,
    conductor_id INT NOT NULL,
    CONSTRAINT vehiculo_conductor_conduce_ux UNIQUE (vehiculo_id, conductor_id),
    CONSTRAINT vehiculo_conductor_conduce_vehiculo_id_fk FOREIGN KEY (vehiculo_id) 
        REFERENCES vehiculo(id),
    CONSTRAINT vehiculo_conductor_conduce_conductor_id_fk FOREIGN KEY (conductor_id) 
        REFERENCES conductor(id)
);

CREATE TABLE proyecto_tecnico_asignado (
    id SERIAL CONSTRAINT proyecto_tecnico_asignado_pk PRIMARY KEY,
    proyecto_id INT NOT NULL,
    tecnico_id INT NOT NULL,
    CONSTRAINT proyecto_tecnico_asignado_ux UNIQUE (proyecto_id, tecnico_id),
    CONSTRAINT proyecto_tecnico_asignado_proyecto_id_fk FOREIGN KEY (proyecto_id) 
        REFERENCES proyecto(id),
    CONSTRAINT proyecto_tecnico_asignado_tecnico_id_fk FOREIGN KEY (tecnico_id) 
        REFERENCES tecnico(id)
);