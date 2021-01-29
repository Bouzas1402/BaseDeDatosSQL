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

-- 2 Insertar al alumno:
INSERT INTO alumno VALUES (1,'Sánchez Hermosilla, Alberto','Higueruelas 12','654782615');


-- 3 Insertar los siguientes alumnos:
INSERT INTO alumno VALUES
(2,'Alba Tordesillas, Ana Maria','Picasso 112','63287559'),
                                                         (3,'Torres Almagro, Guillermo','Alcala 415','651235674'),
                                                         (4,'LLanos Lopez, Maria Luisa','Alcantara 53','679254812');


-- 4 Insertar los siguientes departamentos y asignaturas:
INSERT INTO departamento(id,nombre) VALUES
                                           (1,'Programacion'),
                                           (2,'Sistemas operativos'),
                                           (3,'Bases de datos');
INSERT INTO asignatura VALUES
(1,'Fundamentos de programacion',120,350.00,1),
(2,'Elementos de Hardware',75,200.00,2),
                                         (3,'Programacion avanzada en JAVA',100,400.00,1),
                                         (4,'Sistemas operativos monopuestos',200,450.00,2),
                                         (5,'Implantacion de bases de datos',90,300.00,3),
                                         (6,'Base de datos no relacionales',250,800.00,3);


-- 5 Registrar las siguientes matrículas. Es decir, insertar en la tabla CALIFICACION los datos sin
-- aún la fecha y la calificación (NULL).
INSERT INTO calificacion (alumno_id, asignatura_id) VALUES
(2,4),
     (1,3),
(3,6),
(1,2),
(2,5),
(3,1),
(3,4);

UPDATE calificacion SET calificacion = NULL;

-- 6 Matricular al siguiente alumno en ‘SISTEMAS OPERATIVOS MONOPUESTO’ e
-- ‘IMPLANTACION DE BASES DE DATOS’. Usar los correspondientes asignatura_id para las
-- asignaturas.
INSERT INTO alumno VALUES (5,'Romero Cifuentes, Elena','Marcelo Usera 24','624155975');

INSERT INTO calificacion (alumno_id,asignatura_id) VALUES (5,4), (5,5);


-- 7 Configurar todas las fechas de las calificaciones a ‘01/06/2021’. Para ello usar la función de
-- conversión de cadenas a fechas TO_DATE(‘1/6/2021’).
UPDATE calificacion SET fecha = TO_DATE('1/6/2021');


-- 8 y 9 Configurar la calificación de la asignatura ‘ELEMENTOS DE HARDWARE’ a 6,25 al alumno
-- cuyo id es igual a uno.
-- Asignar al alumno ‘TORRES ALMAGRO, GUILLERMO’ una nota de 7.50 en
-- ‘FUNDAMENTOS DE PROGRAMACION’.
INSERT INTO calificacion (alumno_id, asignatura_id,calificacion) VALUES (1,2,6.25),
                                                                        (3,1,7.50);


-- 10 Dar aprobado general en la asignatura ‘BASES DE DATOS NO RELACIONALES’:
UPDATE calificacion SET calificacion = 5 WHERE asignatura_id = 6;

-- 11 Añadir a la base de datos la asignatura ‘PROGRAMACIÓN EN PYTHON’, con 200 horas de
-- duración, un precio de 500,00 y adscrita al departamento cuyo id es 1:
INSERT INTO asignatura VALUES (7,'Programación en PHYTON',200,500.00,1);

-- 12 Matricular en ‘PROGRAMACIÓN EN PYTHON’ a los alumnos cuyo id es uno, tres y cinco:
INSERT INTO calificacion (alumno_id,asignatura_id) VALUES (1,7),(3,7),(5,7);

-- 13  Actualizar los precios de las matrículas. Aumentar su precio un 5%:
UPDATE asignatura SET precio = precio * 1.05;


-- 14  Aumentar un 10% adicional a las asignaturas con menos de 100 horas lectivas:
UPDATE asignatura SET num_horas = num_horas * 1.10 WHERE num_horas < 100;

-- 15 Reducir el precio de la matrícula 50,00 a las asignaturas adscritas al departamento ‘BASES DE
-- DATOS’:
UPDATE asignatura SET precio = precio - 50.00 WHERE departamento_id = 3;


-- 16 Establecer las calificaciones no actualizadas (NULL) a cero. Usar la clausula ‘calificacion IS
-- NULL’:
UPDATE calificacion SET calificacion = 0 WHERE calificacion IS NULL;


-- 17. Realizar los cambios necesarios para eliminar el departamento ‘BASES DE DATOS’ y asignar
-- las asignaturas que dirige a ‘PROGRAMACION’:
UPDATE asignatura SET departamento_id = 1 WHERE departamento_id = 3;
DELETE FROM departamento WHERE id = 3;