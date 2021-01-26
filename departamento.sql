CREATE TABLE departamento (
	id INT CONSTRAINT departamento_pk PRIMARY KEY,
	nombre VARCHAR(20) NOT null
);

CREATE TABLE vehiculo (
	id INT CONSTRAINT vehiculo_pk PRIMARY KEY,
	matricula CHAR(7) NOT NULL,
	nombre VARCHAR(20) NOT null
);

ALTER TABLE vehiculo
    ADD CONSTRAINT vehiculo_matricula_ux UNIQUE (matricula);

CREATE TABLE proyecto (
	id INT CONSTRAINT proyecto_pk PRIMARY KEY,
	presupuesto NUMERIC(7) NOT NULL 
);

-- tabla empleado
CREATE TABLE empleado (
	id INT CONSTRAINT empleado_pk PRIMARY KEY, 
	departamento_id INT NOT NULL,
	dni CHAR(9) NOT NULL,
	nombre VARCHAR(50) NOT NULL,
	direccion VARCHAR(100),
	CONSTRAINT empleado_departamento_id_fk FOREIGN KEY (departamento_id) 
        REFERENCES departamento(id),
	CONSTRAINT empleado_dni_ux UNIQUE (dni) 
);


CREATE TABLE administrativo (
	id INT CONSTRAINT administrativo_pk PRIMARY KEY, 
	num_idiomas NUMERIC(7) NOT NULL,
	CONSTRAINT administrativo_empleado_id_fk FOREIGN KEY (id) 
        REFERENCES empleado(id) 
);


CREATE TABLE conductor (
	id INT CONSTRAINT conductor_pk PRIMARY KEY,
	num_accidentes SMALLINT NOT NULL,
	num_permiso NUMERIC(7) NOT NULL,
	CONSTRAINT conductor_empleado_id_fk FOREIGN KEY (id) 
        REFERENCES empleado(id) 
);

CREATE TABLE tecnico (
	id INT CONSTRAINT tecnico_pk PRIMARY KEY,
	especialidad VARCHAR(50) NOT NULL,
	CONSTRAINT tecnico_empleado_id_fk FOREIGN KEY (id) 
        REFERENCES empleado(id) 
);

CREATE TABLE vehiculo_conductor_conduce (
	vehiculo_id INT NOT NULL,
	conductor_id INT NOT NULL,
	CONSTRAINT vehiculo_conductor_conduce_pk PRIMARY KEY (vehiculo_id, conductor_id),
	CONSTRAINT vehiculo_conductor_conduce_vehiculo_id_fk FOREIGN KEY (vehiculo_id) 
    	REFERENCES vehiculo(id),
	CONSTRAINT vehiculo_conductor_conduce_conductor_id_fk FOREIGN KEY (conductor_id) 
    	REFERENCES conductor(id)
);

CREATE TABLE proyecto_tecnico_asignado (
	proyecto_id INT NOT NULL,
	tecnico_id INT NOT NULL,
	CONSTRAINT proyecto_tecnico_asignado_pk PRIMARY KEY (proyecto_id, tecnico_id),
	CONSTRAINT proyecto_tecnico_asignado_proyecto_id_fk FOREIGN KEY (proyecto_id) 
   		REFERENCES proyecto(id),
	CONSTRAINT proyecto_tecnico_asignado_tecnico_id_fk FOREIGN KEY (tecnico_id) 
    	REFERENCES tecnico(id)
);

-- CREATE TABLE secuencia (
--     nombre_tabla VARCHAR(100) PRIMARY KEY,
--    identificador INT NOT NULL
-- )

-- (empleado, 4)
-- (conductor, 1)
-- (tecnico, 3)
-- (vehiculo, 27)

INSERT INTO departamento (id, nombre) VALUES (1, "Administración");
INSERT INTO departamento (id, nombre) VALUES (2, "Informática");
INSERT INTO departamento (id, nombre) VALUES (3, "RRHH");

INSERT INTO departamento (id, nombre) VALUES 
    (1, 'Administración'),
    (2, 'Informática'),
    (3, 'RRHH');

INSERT INTO empleado (id,departamento_id, dni,nombre,direccion) VALUES
    (1, 1, '0555666H','Carlos','Calle Avenida 27'),
    (2, 1, '01234Z','Mario','Calle Juan Gómez'),
    (3, 2, '098765J','Elena','Calle García');

INSERT INTO administrativo (id,num_idiomas) VALUES (1, 3);

-- este insert falla
-- INSERT INTO administrativo (id,num_idiomas) VALUES (4, 3);
