CREATE TABLE comprador (
    id SERIALIZABLE CONSTRAINT comprador_id_pk PRIMARY KEY,
     cif_comprador VARCHAR(11),
     nombre_social VARCHAR(30) UNIQUE,
     domicilio_social VARCHAR(30),
     localidad VARCHAR(30),
     codigo_postal VARCHAR(5),
    telefono VARCHAR(9) NOT NULL
);

CREATE TABLE  articulo (
    id SERIALIZABLE CONSTRAINT articulo_id_pk PRIMARY KEY,
referencia_articulo VARCHAR(12),
descripcion_articulo VARCHAR(30),
 precio_unidad NUMERIC(6,2),
 iva NUMERIC (2,0) CHECK (iva >= 5 AND iva <=25),
 existencias_actuales NUMERIC (5,0) DEFAULT 0
);

CREATE TABLE factura (
    id SERIALIZABLE CONSTRAINT factura_id_pk PRIMARY KEY,
num_factura NUMERIC(6,0),
 fecha_factura DATE DEFAULT ('01/01/2005'),
cif_cliente VARCHAR(11),
cod_oficina NUMERIC(4,0) CHECK (cod_oficina > 0 AND cod_oficina <= 1000),
CONSTRAINT factura_cif_cliente_fk FOREIGN KEY
    REFERENCES comprador(id)
);

CREATE TABLE linea_factura (
id SERIALIZABLE CONSTRAINT linea_factura_id_pk PRIMARY KEY,
    num_factura NUMERIC(6,0),
    referencia_articulo VARCHAR(12),
    unidades NUMERIC(3,0),
    CONSTRAINT linea_factura_num_factura_fk FOREIGN KEY
    REFERENCES factura(id)
    ON DELETE CASCADE,
    CONSTRAINT linea_factura_referencia_articulo_fk FOREIGN KEY
    REFERENCES articulo(id)
);