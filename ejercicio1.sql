CREATE DATABASE transportes;

USE transportes;


CREATE TABLE camioneros (
id_camionero varchar(10) primary key,
nombre varchar(20),
direccion varchar(50),
salario double,
ciudad varchar(15)
);

CREATE TABLE camiones (
placa varchar(10) primary key,
modelo varchar(15),
marca varchar(15)
);

CREATE TABLE regiones (
id_region varchar(10) primary key,
nombre_region varchar(15)
);

CREATE TABLE encomiendas (
id_encomienda varchar(10) primary key,
decripcion varchar(256),
destinatario varchar(20),
direccion_destinatario varchar(60),
transportador varchar(10),
region_entrega varchar(10),
foreign key (transportador) references camioneros (id_camionero),
foreign key (region_entrega) references regiones (id_region)
);

CREATE TABLE uso_camion (
camion varchar(10),
camionero varchar(10),
fecha_uso_ini varchar(100),
fecha_uso_fin varchar(100),
foreign key (camion) references camiones (placa),
foreign key (camionero) references camioneros (id_camionero)
);


insert into camiones (placa,modelo,marca) values 
("001-002","Econic","Mercedes-Benz"),
("002-003","Bongo","Kia"),
("005-007","Volkswagen","Hormiga"),
("008-009","Esagmma","Lancia"),
("011-002","GMC","Topkick");

insert into regiones (id_region,nombre_region) values 
("1","Norte"),
("2","Sur"),
("3","Este"),
("4","Oeste"),
("5","Centro");

insert into camioneros (id_camionero,nombre,direccion,salario,ciudad) values 
("001","Andres","Calle x # xx-xx","7000000","Pereira"),
("002","Kevyn","Calle x # xx-xx","8000000","Armenia"),
("003","Samuel","Calle x # xx-xx","9000000","Manizales"),
("004","Juan","Calle x # xx-xx","10000000","Bello"),
("005","David","Calle x # xx-xx","11000000","Medellin");

insert into uso_camion (camion,camionero,fecha_uso_ini,fecha_uso_fin) values 
("001-002","001","23/01/2022","25/01/2022"),
("002-003","002","28/01/2022","30/01/2022"),
("005-007","003","05/02/2022","09/02/2022"),
("008-009","004","14/02/2022","22/02/2022"),
("011-002","005","25/02/2022","25/03/2022");

insert into encomiendas (id_encomienda,decripcion,destinatario,direccion_destinatario,transportador,region_entrega) values
("00001","Alimentos - No Delicado","Juan","Calle x # xx-xx","001","1"),
("00002","Paquetes - Delicado","José","Calle x # xx-xx","002","2"),
("00003","Medicamentos - Delicado","Hugo","Calle x # xx-xx","003","3"),
("00004","Carnes - No Delicado","Andrea","Calle x # xx-xx","004","4"),
("00005","Varios - Delicado","Mariana","Calle x # xx-xx","005","5");

/*Datos Principales camionero*/
select * from camioneros where (id_camionero) = '001';

/*Encomiendas de un camionero*/
SELECT id_encomienda,destinatario,decripcion,nombre FROM encomiendas inner join camioneros on encomiendas.transportador = camioneros.id_camionero where transportador = '001';

/*Encomiendas por region*/
SELECT id_encomienda,destinatario,decripcion,nombre_region FROM encomiendas inner join regiones on encomiendas.region_entrega = regiones.id_region where region_entrega = '5';

/*Encomienda datos*/
SELECT id_encomienda,destinatario,decripcion,nombre_region,nombre FROM encomiendas inner join regiones on encomiendas.region_entrega = regiones.id_region inner join camioneros on encomiendas.transportador = camioneros.id_camionero;

/*Usuarios Region - No hay Repetidos*/
SELECT destinatario,nombre_region FROM encomiendas inner join regiones on encomiendas.region_entrega = regiones.id_region;

/*Fecha de Entrega - No hay atributos de fecha de entrega*/
/*Camioneros con R*/
SELECT nombre FROM camioneros where nombre like "%R%";

/*Uso camion por Placa*/
SELECT nombre,marca,modelo,placa FROM camioneros inner join uso_camion on camioneros.id_camionero = uso_camion.camionero inner join camiones on camiones.placa = uso_camion.camion where camiones.placa = "001-002";

/*Encomiendas por camionero*/
SELECT id_camionero,nombre FROM camioneros inner join encomiendas on encomiendas.transportador = camioneros.id_camionero where encomiendas.id_encomienda = "00001";

/*Uso camion por fecha*/
SELECT nombre,placa,marca,modelo,fecha_uso_ini,fecha_uso_fin FROM camioneros inner join uso_camion on uso_camion.camionero = camioneros.id_camionero inner join camiones on camiones.placa = uso_camion.camion;


/*Procedimientos Almacenados*/
	
    /*simple*/
	create procedure sp_consultar_camioneros()
	select * from camioneros;

	call sp_consultar_camioneros;

	/*Con parametros*/
    create procedure sp_consultar_camiones(marca_m varchar(15))
	select * from camiones where marca = marca_m;

	call sp_consultar_camiones ("Mercedes-Benz");
    
    /*Eliminacion Procedimiento*/
    drop procedure sp_consultar_camiones;
    
    /*Delimitado por bloques*/
    DELIMITER $$
		create procedure sp_actualizar_encomienda(id_e = varchar(10), n_nombre = varchar(20))
			begin 
                update encomiendas set destinatario = n_nombre where id_encomienda = id_e;
                select * from encomiendas;
			end;//
	DELIMITER ;
    call sp_actualizar_encomienda("00001","Carlos");