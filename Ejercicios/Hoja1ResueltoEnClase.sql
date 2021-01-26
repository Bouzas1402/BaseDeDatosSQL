CREATE TABLE comprador (
    cif_comprador char(11) CONSTRAINT comprador_pk PRIMARY KEY,
    nombre_social VARCHAR(30) NOT NULL,
domicilio_social VARCHAR(30),
localidad VARCHAR(30),
c_postal CHAR(5),
telefono CHAR(9) NOT NULL,
CONSTRAINT comprador_nombre_social_ux UNIQUE (nombre_social)
);

CREATE TABLE articulo (
  articulo_referencia CHAR(12) CONSTRAINT articulo_pk PRIMARY KEY,
descripcion_articulo VARCHAR(30) NOT NULL,
precio_unidad NUMERIC(6,2),
iva NUMERIC(2,0),
existencias_actuales NUMERIC(5,0) DEFAULT 0,
CONSTRAINT articulo_iva_ck CHECK ( iva BETWEEN 5 AND 25)
);

CREATE TABLE factura (
    num_factura NUMERIC(6,0) CONSTRAINT factura_pk PRIMARY KEY,
    fecha_factura DATE DEFAULT TO_DATE('01/01/2015','DD/MM/YYYY'),
    cid_cliente CHAR(11) NOT NULL

);

CREATE TABLE linea_factura (
num_factura NUMERIC(6,0) NOT NULL,
articulo_referencia CHAR(12) NOT NULL,
CONSTRAINT linea_factura_pk PRIMARY KEY (num_factura,articulo_referencia),
CONSTRAINT linea_factura_factura_num_factura_fk FOREIGN KEY num_factura
REFERENCES factura (num_factura),
CONSTRAINT linea_factura_articulo_articulo_referencia_fk FOREIGN KEY articulo_referencia
REFERENCES articulo (articulo_referencia)
);

--Eercicios adicionales

-- PUNTO 2

ALTER TABLE factura
ADD COLUMN cod_oficina  NUMERIC(4,0);


-- PUNTO 3

ALTER TABLE factura
ADD CONSTRAINT factura_comprador_cif_comprador_fk FOREIGN KEY (cif_comprador)
REFERENCES comprador (cif_comprador);


--PUNTO 4

ALTER TABLE comprador
RENAME COLUMN c_postal TO codigo_postal;


--PUNTO 5

ALTER TABLE factura
ADD CONSTRAINT factura_cod_oficina_ck CHECK (cod_oficina BETWEEN 1 AND 1000);