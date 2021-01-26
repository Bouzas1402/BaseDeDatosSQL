-- Centro comercial


-- Comprador1
CREATE TABLE comprador_1 (
                           cif_comprador CHAR(11),
                           nombre_social VARCHAR(30) NOT NULL,
                           domicilio_social VARCHAR(30),
                           localidad VARCHAR(30),
                           c_postal CHAR(5),
                           telefono CHAR(9) NOT NULL
);

CREATE TABLE articulo_1 (
                          articulo_referencia CHAR(12),
                          descripcion_articulo VARCHAR(30) NOT NULL,
                          precio_unidad NUMERIC(6,2),
                          iva NUMERIC(2,0),
                          existencias_actuales NUMERIC(5,0) DEFAULT 0
);

CREATE TABLE factura_1 (
                         num_factura NUMERIC(6,0),
                         fecha_factura DATE DEFAULT TO_DATE('01/01/2015','DD/MM/YYYY'),
                         cif_cliente CHAR(11) NOT NULL

);

CREATE TABLE linea_factura_1 (
                               num_factura NUMERIC(6,0) NOT NULL,
                               articulo_referencia CHAR(12) NOT NULL
);


-- Comprador 2
CREATE TABLE comprador_2 (
                           cif_comprador CHAR(11) CONSTRAINT comprador_2_cif_comprador_pk PRIMARY KEY,
                           nombre_social VARCHAR(30) NOT NULL,
                           domicilio_social VARCHAR(30),
                           localidad VARCHAR(30),
                           c_postal CHAR(5),
                           telefono CHAR(9) NOT NULL
);

CREATE TABLE articulo_2 (
                          articulo_referencia CHAR(12) CONSTRAINT articulo_2_articulo_referencia_pk PRIMARY KEY,
                          descripcion_articulo VARCHAR(30) NOT NULL,
                          precio_unidad NUMERIC(6,2),
                          iva NUMERIC(2,0) CONSTRAINT articulo_2_iva_ck CHECK (iva BETWEEN 0 AND 25),
                          existencias_actuales NUMERIC(5,0) DEFAULT 0
);

CREATE TABLE factura_2 (
                         num_factura NUMERIC(6,0) CONSTRAINT factura_2_num_factura_pk PRIMARY KEY,
                         fecha_factura DATE DEFAULT TO_DATE('01/01/2015','DD/MM/YYYY'),
                         cif_cliente CHAR(11) NOT NULL CONSTRAINT factura_2_cif_cliente_fk FOREIGN KEY
                       REFERENCES comprador_2(cif_comprador)
);

CREATE TABLE linea_factura_2 (
                               num_factura NUMERIC(6,0) NOT NULL,
                               articulo_referencia CHAR(12) NOT NULL
);


-- Comprador 3:
CREATE TABLE comprador_3 (
                             pk_comprador_3 CHAR(11),
                             uq_comprador_nombre_social_3 VARCHAR(30) NOT NULL,
                             domicilio_social VARCHAR(30),
                             localidad VARCHAR(30),
                             c_postal CHAR(5),
                             telefono CHAR(9) NOT NULL,
                             CONSTRAINT comprador_3_pk PRIMARY KEY (pk_comprador_3) ,
    CONSTRAINT comprador_3_uq_comprador_nombre_social_ux UNIQUE (uq_comprador_nombre_social_3)
);

CREATE TABLE articulo_3 (
                            articulo_referencia CHAR(12),
                            descripcion_articulo VARCHAR(30) NOT NULL,
                            precio_unidad NUMERIC(6,2),
                            iva NUMERIC(2,0),
                            existencias_actuales NUMERIC(5,0) DEFAULT 0,
                            CONSTRAINT articulo_3_pk PRIMARY KEY (articulo_referencia)
);

CREATE TABLE factura_3 (
                           num_factura NUMERIC(6,0),
                           fecha_factura DATE DEFAULT TO_DATE('01/01/2015','DD/MM/YYYY'),
                           cif_cliente CHAR(11) NOT NULL

);

CREATE TABLE linea_factura_3 (
                                 num_factura NUMERIC(6,0) NOT NULL,
                                 articulo_referencia CHAR(12) NOT NULL
);
