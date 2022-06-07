create database sena;

use sena;

CREATE TABLE carrera(
codigo_c varchar(5) primary key,
nombre_c varchar(30),
duracion int
);

CREATE TABLE profesor(
documento_p varchar(10) primary key,
nombre_p varchar(30),
telefono_p varchar(10),
direccion_p varchar(30),
email_p varchar(30),
especialidad_p varchar(30)
);

CREATE TABLE materia(
codigo_m varchar(5) primary key,
nombre_m varchar (30)
);

CREATE TABLE alumno(
documento_a varchar(10) primary key,
nombre_a varchar(30),
telefono_a varchar(10),
direccion_a varchar(30),
email_a varchar(30),
codigo_c1 varchar(5),
foreign key (codigo_c1)  references carrera (codigo_c)
);

CREATE TABLE alu_pro(
documento_a1 varchar(10),
documento_p1 varchar(10),
foreign key (documento_a1) references alumno(documento_a),
foreign key (documento_p1) references profesor(documento_p)
);

CREATE TABLE alu_mat(
documento_a2 varchar(10),
codigo_m1 varchar(5),
foreign key (documento_a2) references alumno(documento_a),
foreign key (codigo_m1) references materia(codigo_m)
);

CREATE TABLE pro_mat(
documento_p2 varchar(10),
codigo_m2 varchar(5),
foreign key (documento_p2) references profesor(documento_p),
foreign key (codigo_m2) references materia(codigo_m)
);



insert into carrera (codigo_c,nombre_c,duracion) values ("001","Ingenieria de Software",10);
insert into carrera (codigo_c,nombre_c,duracion) values ("002","Ingenieria Electronica",10);
insert into carrera (codigo_c,nombre_c,duracion) values ("003","Ingenieria de Alimentos",10);
insert into carrera (codigo_c,nombre_c,duracion) values ("004","Ingenieria de Ambiental",10);
insert into carrera (codigo_c,nombre_c,duracion) values ("005","Ingenieria Industrial",10);

insert into profesor (documento_p,nombre_p,telefono_p,direccion_p,email_p,especialidad_p) values ("000001","Jose Velasquez","55555","Medellin","jopose@hotmail.com","001");
insert into profesor (documento_p,nombre_p,telefono_p,direccion_p,email_p,especialidad_p) values ("000002","Kevyn Garzon","55666","Medellin","kegaz@hotmail.com","002");
insert into profesor (documento_p,nombre_p,telefono_p,direccion_p,email_p,especialidad_p) values ("000003","David Bisbal","77555","Medellin","davib_al@hotmail.com","003");
insert into profesor (documento_p,nombre_p,telefono_p,direccion_p,email_p,especialidad_p) values ("000004","Laura Suarez","55885","Medellin","lausua@hotmail.com","004");
insert into profesor (documento_p,nombre_p,telefono_p,direccion_p,email_p,especialidad_p) values ("000005","Andrea Gomez","58925","Medellin","ago35@hotmail.com","005");

insert into materia (nombre_m,codigo_m) values ("Calculo","001");
insert into materia (nombre_m,codigo_m) values ("Diseño","002");
insert into materia (nombre_m,codigo_m) values ("Circuitos 2","003");
insert into materia (nombre_m,codigo_m) values ("Ed Fisica","004");
insert into materia (nombre_m,codigo_m) values ("Etica","005");

insert into alumno (documento_a,nombre_a,telefono_a,direccion_a,email_a,codigo_c1) values ("123","Kevyn","789","Armenia","kev@gmail.com","001");
insert into alumno (documento_a,nombre_a,telefono_a,direccion_a,email_a,codigo_c1) values ("1234","David","456","Armenia","dav@gmail.com","002");
insert into alumno (documento_a,nombre_a,telefono_a,direccion_a,email_a,codigo_c1) values ("12345","Juan","000","Armenia","jua@gmail.com","003");
insert into alumno (documento_a,nombre_a,telefono_a,direccion_a,email_a,codigo_c1) values ("123456","Luisa","123789","Armenia","lui@gmail.com","004");
insert into alumno (documento_a,nombre_a,telefono_a,direccion_a,email_a,codigo_c1) values ("1234567","Maria","0316","Armenia","mar@gmail.com","005");

insert into alu_pro (documento_a1,documento_p1) values ("123","000001"),("1234","000002"),("12345","000003"),("123456","000004"),("1234567","000005");
insert into alu_mat (documento_a2,codigo_m1) values ("123","001"),("1234","002"),("12345","003"),("123456","004"),("1234567","005");
insert into pro_mat (documento_p2,codigo_m2) values ("000001","001"),("000002","002"),("000003","003"),("000004","004"),("000005","005");


/*Busquedas en la base de datos con INNER JOIN*/

/*inner join sencillo*/
SELECT nombre_a, telefono_a, email_a, nombre_c FROM alumno 
INNER JOIN carrera ON alumno.codigo_c1 = carrera.codigo_c;

/*inner join doble*/
SELECT nombre_a, telefono_a, email_a, nombre_m FROM alumno 
INNER JOIN alu_mat ON alu_mat.documento_a2 = alumno.documento_a 
INNER JOIN  materia ON materia.codigo_m = alu_mat.codigo_m1;

/*inner join cuadruple para varios atributos de tablas*/
SELECT nombre_a, telefono_a, email_a, nombre_m, nombre_p FROM alumno 
INNER JOIN alu_mat ON alu_mat.documento_a2 = alumno.documento_a 
INNER JOIN materia ON materia.codigo_m = alu_mat.codigo_m1 
INNER JOIN alu_pro ON alu_pro.documento_a1 = alumno.documento_a
INNER JOIN profesor ON profesor.documento_p = alu_pro.documento_p1;