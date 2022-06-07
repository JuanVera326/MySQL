CREATE schema tecnologicaTienda;

use tecnologicaTienda;

CREATE TABLE productos(
    id_producto varchar(45) primary key,
    nombre_producto varchar(45),
    valor_producto double,
    marcaMmodelo_producto varchar (100),
    tipo_producto varchar(20),
    proveedor_producto varchar(45)
);

CREATE TABLE clientes(
    id_cliente varchar(45) primary key,
    nombre_cliente varchar(45),
    telefono varchar(45),
    ciudad varchar(30)
);

CREATE TABLE proveedores(
	id_proveedor varchar (45) primary key,
    razon_sociial varchar (45),
    nombre_provedor varchar (45),
    direccion_proveedor varchar (60),
    ciudad_proveedor varchar (20),
    telefono_proveedor varchar (30)
);
CREATE TABLE ventas(
	id_venta varchar(45),
    productos_venta varchar(45),
    fecha_transaccion datetime,
    foreign key (id_venta) references clientes (id_cliente),
    foreign key (productos_venta) references productos (id_producto)
);

create table provee_product(
	id_proveedores varchar (45),
    id_productos varchar (45),
    foreign key (id_proveedores) references proveedores (id_proveedor),
    foreign key (id_productos) references productos (id_producto)
);

/*-----------------------------------------------------------------------------*/
 DELIMITER $$
create procedure sp_insertar_cliente(
	id_cliente varchar(45),
    nombre_cliente varchar(45),
    telefono varchar(45),
    ciudad varchar(30))
	BEGIN
		declare id varchar(45);
        declare nombre varchar(45);
        declare tel varchar(45);
        declare ciu varchar(30);
		insert into clientes values (id_cliente,nombre_cliente,telefono,ciudad);
    END; $$
    
DELIMITER ;
/*-------------------------------------------------------------------------------*/

call sp_insertar_cliente("111","Juan","879465","Armenia");