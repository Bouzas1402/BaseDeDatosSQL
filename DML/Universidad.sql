CREATE TABLE alumno (
    id NUMERIC(6),
    nombre VARCHAR(40),
    direccion VARCHAR(40),
    telefono VARCHAR(12),
    CONSTRAINT alumno_pk PRIMARY KEY (id)
);
CREATE TABLE departamento (
    id NUMERIC(4) CONSTRAINT departamento_id_pk PRIMARY KEY,
    nombre VARCHAR(40)
);
CREATE TABLE asignatura (
    id NUMERIC(6) CONSTRAINT asignatura_pk PRIMARY KEY,
    nombre VARCHAR(50),
    num_horas NUMERIC(4,0),
precio NUMERIC(7,2),
departamento_id NUMERIC(4),
CONSTRAINT asignatura_num_horas_ck CHECK ( num_horas BETWEEN 1 AND 1000),
CONSTRAINT asignatura_departamento_id_fk FOREIGN KEY departamento_id
                        REFERENCES departamento (id)
);
CREATE TABLE calificacion (
    alumno_id NUMERIC(6) CONSTRAINT calificacion_pk PRIMARY KEY,
    asignatura_id NUMERIC(6) CONSTRAINT calificacion_pk PRIMARY KEY,
    fecha DATE,
    calificacion NUMERIC(4,2),
    CONSTRAINT calificacion_alumno_id_fk FOREIGN KEY alumno_id REFERENCES alumno(id),
                          CONSTRAINT calificacion_asignatura_id FOREIGN KEY asignatura_id
                          REFERENCES asignatura(id),
                          CONSTRAINT calificacion_calificacion_ck CHECK (calificacion BETWEEN 0 AND 10)
);

-- INSERTAR DATOS
-- 2
INSERT INTO alumno(id,nombre,direccion,telefono) VALUES (1,'Sánchez Hermosilla, Alberto','Higueruelas 12','654782615');

-- 3
INSERT INTO alumno (id,nombre,direccion,telefono) VALUES
(2,'Alba Tordesillas, Ana Maria','Picasso 112','63287559'),
                                                         (3,'Torres Almagro, Guillermo','Alcala 415','651235674'),
                                                         (4,'LLanos Lopez, Maria Luisa','Alcantara 53','679254812');

-- 4
INSERT INTO departamento(id,nombre) VALUES
                                           (1,'Programacion'),
                                           (2,'Sistemas operativos'),
                                           (3,'Bases de datos');
INSERT INTO asignatura(id,nombre,departamento_id) VALUES
(1,'Programacion en PYTHON',1),
(2,'Sistemas operativos monopuestos',2),
                                         (3,'Elementos de Hardware',2),
                                         (4,'Base de datos no relacionales',3),
                                         (5,'Implantacion de bases de datos',3),
                                         (6,'Fundamentos de programacion',1);

-- 5
INSERT INTO calificacion (alumno_id, asignatura_id) VALUES
(2,4),
     (1,3),
(3,6),
(1,2),
(2,5),
(3,1),
(3,4);

-- 6
INSERT INTO alumno (id, nombre, direccion, telefono) VALUES (5,'Romero Cifuentes, Elena','Marcelo Usera 24','624155975');

INSERT INTO calificacion (alumno_id,asignatura_id) VALUES (5,2), (5,5);


-- 7
UPDATE calificacion SET fecha = TO_DATE('1/6/2021');


-- 8 y 9
INSERT INTO calificacion (alumno_id, asignatura_id,calificacion) VALUES (1,3,6.25),
                                                                        (3,6,7.50);

-- 10
UPDATE calificacion SET calificacion = 5 WHERE asignatura_id = 3;

-- 11
UPDATE asignatura SET


