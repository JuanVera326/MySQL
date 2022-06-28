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
    foreign key (id_venta) references clientes (id_cliente)on delete cascade,
    foreign key (productos_venta) references productos (id_producto) on delete cascade
);

create table entregas_inv(
	id_proveedores varchar (45),
    id_productos varchar (45),
    foreign key (id_proveedores) references proveedores (id_proveedor)on delete cascade,
    foreign key (id_productos) references productos (id_producto)on delete cascade
);
/*-------------------------------------------------------------------------------*/
/*----------------------------REGISTRO-------------------------------*/
/*-------------------------------------------------------------------------------*/

/*---------------------------AGREGAR CLIENTE-----------------------------------*/
 DELIMITER $$
create procedure sp_insertar_cliente(
	id varchar(45),
    nomb varchar(45),
    tel varchar(45),
    ciu varchar(30))
	BEGIN
		insert into clientes values (id,nomb,tel,ciu);
    END; $$
    
DELIMITER ;

call sp_insertar_cliente("111","Juan","879465","Armenia");
call sp_insertar_cliente("222","Jose","879466","Cali");
/*-------------------------------------------------------------------------------*/
/*---------------------------AGREGAR PRODUCTO-----------------------------------*/
 DELIMITER $$
create procedure sp_insertar_producto(
	id varchar(45),
    nomb varchar(45),
    val double,
    marca varchar(100),
    tip varchar (20),
    prov varchar (45))
	BEGIN
		insert into productos values (id,nomb,val,marca,tip,prov);
    END; $$
    
DELIMITER ;

call sp_insertar_producto("555-000","PC Gamer","5000000","Asus ROG Desktop","Ordenador","000-001");
call sp_insertar_producto("556-000","PC Gamer","5500000","Acer Predator 500 Laptop","Ordenador","000-002");
/*-------------------------------------------------------------------------------*/
/*---------------------------AGREGAR PROVEEDOR-----------------------------------*/
 DELIMITER $$
create procedure sp_insertar_proveedor(
	id varchar(45),
    raz varchar(45),
    nomb varchar(45),
    dir varchar(60),
    ciu varchar(20),
    tel varchar (30))
	BEGIN
		insert into proveedores values (id,raz,nomb,dir,ciu,tel);
    END; $$
    
DELIMITER ;

call sp_insertar_proveedor("000-001","Entregas Rapidas","Elvis Ioso","Calle x # xx-xx","Armenia","789456");
call sp_insertar_proveedor("000-002","Entregas Super Rapidas","Susana Horia","Carrera x # xx-xx","Pereira","123456");
/*-------------------------------------------------------------------------------*/
/*---------------------------AGREGAR VENTAS-----------------------------------*/
 DELIMITER $$
create procedure sp_insertar_venta(
	id varchar(45),
    prod varchar(45),
    fec datetime)
	BEGIN
		insert into ventas values (id,prod,fec);
    END; $$
    
DELIMITER ;

call sp_insertar_venta("111","555-000","2022-1-1");
call sp_insertar_venta("222","556-000","2020-12-12");
/*-------------------------------------------------------------------------------*/
/*---------------------------AGREGAR ENTREGAS-----------------------------------*/
 DELIMITER $$
create procedure sp_insertar_entrega(
	id_pro varchar(45),
    id_prod varchar(45))
	BEGIN
		insert into entregas_inv values (id_prod,id_pro);
    END; $$
		
DELIMITER ;

call sp_insertar_entrega("555-000","000-001");
call sp_insertar_entrega("556-000","000-002");

/*-------------------------------------------------------------------------------*/
/*--------------------------CONSULTAS--------------------------*/
/*-------------------------------------------------------------------------------*/

/*---------------------------CONSULTAR CLIENTE-----------------------------------*/
 DELIMITER $$
create procedure sp_consultar_cliente(
	id varchar(45))
	BEGIN
		select * from clientes where id_cliente = (id);
    END; $$
    
DELIMITER ;

call sp_consultar_cliente("111");
call sp_consultar_cliente("222");
/*-------------------------------------------------------------------------------*/
/*---------------------------CONSULTAR PRODUCTO-----------------------------------*/
 DELIMITER $$
create procedure sp_consultar_producto(
	id varchar(45))
	BEGIN
		select * from productos where id_producto = (id);
    END; $$
    
DELIMITER ;

call sp_consultar_producto("555-000");
call sp_consultar_producto("556-000");
/*-------------------------------------------------------------------------------*/
/*---------------------------CONSULTAR PROVEEDOR-----------------------------------*/
 DELIMITER $$
create procedure sp_consultar_proveedor(
	id varchar(45))
	BEGIN
		select * from proveedores where id_proveedor = (id);
    END; $$
    
DELIMITER ;

call sp_consultar_proveedor("000-001");
call sp_consultar_proveedor("000-002");
/*-------------------------------------------------------------------------------*/
/*---------------------------CONSULTAR VENTAS-----------------------------------*/
 DELIMITER $$
create procedure sp_consultar_venta(
	id varchar(45))
	BEGIN
		select * from ventas where id_venta = (id);
    END; $$
    
DELIMITER ;

call sp_consultar_venta("111");
call sp_consultar_venta("222");
/*-------------------------------------------------------------------------------*/
/*---------------------------CONSULTAR ENTREGAS-----------------------------------*/
 DELIMITER $$
create procedure sp_consultar_entrega(
	id_pro varchar(45))
	BEGIN
		select * from entregas_inv where id_productos = (id_pro);
    END; $$
    
DELIMITER ;

call sp_consultar_entrega("555-000");
call sp_consultar_entrega("556-000");

/*-------------------------------------------------------------------------------*/
/*--------------------------ACTUALIZACION--------------------------*/
/*-------------------------------------------------------------------------------*/

/*---------------------------ACTUALIZAR CLIENTE-----------------------------------*/
 DELIMITER $$
create procedure sp_actualizar_cliente(
	id varchar(45),
    nomb varchar(45),
    tel varchar(45),
    ciu varchar(30))
	BEGIN
		UPDATE clientes SET nombre_cliente = nomb ,telefono = tel ,ciudad = ciu where id_cliente = id;
    END; $$
    
DELIMITER ;

call sp_actualizar_cliente("111","Juan J","879465","Armenia");
call sp_actualizar_cliente("222","Jose A","879466","Cali");
/*-------------------------------------------------------------------------------*/
/*---------------------------ACTUALIZAR PRODUCTO-----------------------------------*/
 DELIMITER $$
create procedure sp_actualizar_producto(
	id varchar(45),
    nomb varchar(45),
    val double,
    marca varchar(100),
    tip varchar (20),
    prov varchar (45))
	BEGIN
		UPDATE productos SET nombre_producto = nomb ,valor_producto = val, marcaMmodelo_producto = marca, tipo_producto = tip, proveedor_producto = prov where id_producto = id;
    END; $$
    
DELIMITER ;

call sp_actualizar_producto("555-000","PC Gamer","6000000","Asus ROG Desktop","Ordenador","000-001");
call sp_actualizar_producto("556-000","PC Gamer","6500000","Acer Predator 500 Laptop","Ordenador","000-002");
/*-------------------------------------------------------------------------------*/
/*---------------------------ACTUALIZAR PROVEEDOR-----------------------------------*/
 DELIMITER $$
create procedure sp_actualizar_proveedor(
	id varchar(45),
    raz varchar(45),
    nomb varchar(45),
    dir varchar(60),
    ciu varchar(20),
    tel varchar (30))
	BEGIN
		UPDATE proveedores SET razon_sociial = raz, nombre_provedor = nomb, direccion_proveedor = dir, ciudad_proveedor = ciu, telefono_proveedor = tel where id_proveedor = id;
    END; $$
    
DELIMITER ;

call sp_actualizar_proveedor("000-001","Entregas Muy Rapidas","Elvis Ioso","Calle x # xx-xx","Armenia","789456");
call sp_actualizar_proveedor("000-002","Entregas Super Rapidas","Susana Horia Hernandez","Carrera x # xx-xx","Pereira","123456");
/*-------------------------------------------------------------------------------*/
/*---------------------------ACTUALIZAR VENTAS-----------------------------------*/
 DELIMITER $$
create procedure sp_actualizar_venta(
	id varchar(45),
    fec datetime)
	BEGIN
		UPDATE ventas SET fecha_transaccion = fec where id_venta = id;
    END; $$
    
DELIMITER ;


call sp_actualizar_venta("111","2032-1-1");
call sp_actualizar_venta("222","2000-12-12");
/*-------------------------------------------------------------------------------*/
/*--------------------------ELIMINACION--------------------------*/
/*-------------------------------------------------------------------------------*/

/*---------------------------ELIMINAR EN CASCADA-----------------------------------*/
 DELIMITER $$
create procedure sp_eliminar_cliente(
	id varchar(45))
	BEGIN
		DELETE FROM clientes where id_cliente = id;
    END; $$
    
DELIMITER ;

call sp_eliminar_cliente("111");
call sp_eliminar_cliente("222");
/*-------------------------------------------------------------------------------*/