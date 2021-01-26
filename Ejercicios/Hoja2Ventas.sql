CREATE TABLE cliente (
                         id SERIAL PRIMARY KEY,
                         nombre VARCHAR(25),
                         primer_apellido VARCHAR(15) NOT NULL,
                         ciudad VARCHAR(100),
                         categoria INT
);
CREATE TABLE comercial (
                           id SERIAL PRIMARY KEY,
                           nombre VARCHAR(100) NOT NULL,
                           apellido1 VARCHAR(100) NOT NULL,
                           apellido2 VARCHAR(100),
                           ciudad VARCHAR(100),
                           comision FLOAT
);


-- Modifique la columna nombre de la tabla cliente para que pueda almacenar cadenas de
-- hasta 100 caracteres y para que no pueda ser NULL.

ALTER TABLE cliente
    ALTER COLUMN nombre TYPE VARCHAR(100);
ALTER TABLE cliente
ALTER COLUMN nombre SET NOT NULL;

-- ¿Qué comando puede ejecutar para comprobar que el cambio que se ha realizado en el paso
-- anterior se ha ejecutado correctamente?

SELECT * FROM cliente;

-- Modifique el nombre de la columna primer_apellido y asígnele apellido1.
-- También tendrá que permitir que pueda almacenar hasta 100 caracteres y que no pueda ser
-- un valor NULL.

ALTER TABLE cliente
CHANGE primer_apellido apellido1 VARCHAR(15);

-- Añada una nueva columna a la tabla cliente para poder almacenar el segundo apellido.
-- La columna se debe llamar apellido2 debe estar entre la columna apellido1 y
-- ciudad, puede almacenar hasta 100 caracteres y puede ser NULL.

DROP TABLE cliente;
CREATE TABLE cliente (
                         id SERIAL PRIMARY KEY,
                         nombre VARCHAR(100) NOT NULL,
                         primer_apellido VARCHAR(15) NOT NULL,
                         segundo_apellido VARCHAR(100) NULL,
                         ciudad VARCHAR(100),
                         categoria INT
);


-- Haga que la columna categoria solo admita enteros sin signo

ALTER TABLE cliente
ALTER COLUMN categoria INT UNSIGNED,

-- Elimine la columna categoria de la tabla cliente.

ALTER TABLE cliente DROP COLUMN categoria;

-- Modifique la columna comision de la tabla comercial para que almacene por defecto el valor 10

ALTER TABLE comercial ADD DEFAULT 10 FOR comision;