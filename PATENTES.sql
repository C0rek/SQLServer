--creo la base de datos
CREATE DATABASE PATENTES
--elimino la base de datos
DROP DATABASE PATENTES
--uso la base de datos patentes
USE PATENTES

--creo las tablas
CREATE TABLE INVENTOR(
DNI int not null,
nombre varchar not null,
apellido varchar not null,
direccion varchar not null,
telefono int null,
DNIAyudante int not null,
)
CREATE TABLE AYUDANTE(
DNI int not null,
nombre varchar not null,
apellido varchar not null,
direccion varchar not null,
telefono int null,
)
CREATE TABLE REGISTRO(
ID int not null,
fecha date not null,
DNIInventor int not null,
NumPatente int not null,
)
CREATE TABLE PATENTE(
numero int not null,
nombre varchar not null,
)
CREATE TABLE COMPRA(
ID int not null,
fecha date not null,
NumPatente int not null,
IDComprador int not null,
)
CREATE TABLE COMPRADOR(
ID int not null,
nombre varchar not null,
direccion varchar not null,
telefono int not null,
)

--creo claves primarias
alter table INVENTOR add primary key clustered(DNI)
alter table AYUDANTE add primary key clustered(DNI)
alter table PATENTE add primary key clustered(numero)
alter table COMPRADOR add primary key clustered(ID)
alter table COMPRA add primary key clustered(ID)
alter table REGISTRO add primary key clustered(ID)

--creo las claves foraneas
alter table INVENTOR
add constraint fkInventorAyudanteDNI
foreign key (DNIAyudante) references Ayudante(DNI)
alter table REGISTRO
add constraint fkRegistroInventorDNI
foreign key (DNIInventor) references Inventor(DNI)
alter table REGISTRO
add constraint fkRegistroPatenteNum
foreign key (NumPatente) references Patente(numero)
alter table COMPRA
add constraint fkCompraPatenteNum
foreign key (NumPatente) references Patente(numero)
alter table COMPRA
add constraint fkCompraCompradorID
foreign key (IDComprador) references Comprador(ID)

--crear un indice no clustered por tabla
create nonclustered index ixAyudanteDNI on Ayudante(DNI)
create nonclustered index ixInventorDNI on Inventor(DNI)
create nonclustered index ixPatenteNUM on Patente(numero)
create nonclustered index ixCompradorID on Comprador(ID)
create nonclustered index ixCompraID on Compra(ID)
create nonclustered index ixRegistroID on Registro(ID)

--elimino uno de los indices creados
drop index ixAyudanteDNI on Ayudante

--a la tabla compra agrego el campo lugar
alter table COMPRA add lugar varchar not null
alter table COMPRA add check (lugar in('Salta', 'Tucuman','Jujuy'))

--a la tabla patente agrego el campo fecha de alta
alter table PATENTE add FechaDeAlta date not null
--elimino Fecha de Alta
alter table PATENTE drop column FechaDeAlta
