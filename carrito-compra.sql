
CREATE TABLE inventario (
                id_producto INT NOT NULL,
                sku INT NOT NULL,
                fecha_ingreso_producto DATE NOT NULL,
                nombre_producto VARCHAR(80) NOT NULL,
                stock INT NOT NULL,
                descripcion_producto VARCHAR(205) NOT NULL,
                precio_producto DECIMAL(7,2) NOT NULL,
                fecha_ultima_venta DATE NOT NULL,
                PRIMARY KEY (id_producto)
);


CREATE TABLE Producto (
                sku_producto INT NOT NULL,
                Nombre VARCHAR(80) NOT NULL,
                precio DECIMAL(7,2) NOT NULL,
                descripcion VARCHAR(150) NOT NULL,
                garantia CHAR(2) NOT NULL,
                fecha_vencimiento DATE,
                id_producto INT NOT NULL,
                PRIMARY KEY (sku_producto)
);


CREATE TABLE encabezado (
                id_factura INT NOT NULL,
                id_cliente INT NOT NULL,
                Fecha_transaccion DATE NOT NULL,
                direccion_cliente VARCHAR(100),
                metodo_pago VARCHAR(30) NOT NULL,
                nombre VARCHAR(25) NOT NULL,
                apellido VARCHAR(30),
                telefono_mobil INT,
                correo_electronico VARCHAR(260),
                Informacion_Envio VARCHAR(300),
                sku_producto INT NOT NULL,
                PRIMARY KEY (id_factura)
);


CREATE TABLE factura (
                id_detalle INT NOT NULL,
                nit INT,
                dpi INT NOT NULL,
                cantidad INT NOT NULL,
                producto VARCHAR(80) NOT NULL,
                precio_unitario DECIMAL(7,2) NOT NULL,
                costo_envio DECIMAL(6,2) NOT NULL,
                impuesto DECIMAL(7,2),
                descuento DECIMAL(6,2),
                total DECIMAL(11,2),
                encabezado_id_factura INT NOT NULL,
                PRIMARY KEY (id_detalle)
);


ALTER TABLE Producto ADD CONSTRAINT inentario_1_producto_fk
FOREIGN KEY (id_producto)
REFERENCES inventario (id_producto)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE encabezado ADD CONSTRAINT producto_encabezado_fk
FOREIGN KEY (sku_producto)
REFERENCES Producto (sku_producto)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE factura ADD CONSTRAINT encabezado_factura_fk1
FOREIGN KEY (encabezado_id_factura)
REFERENCES encabezado (id_factura)
ON DELETE NO ACTION
ON UPDATE NO ACTION;