create database Parcial2

use Parcial2

create table camionero(
DNI varchar(10) not null,
nombre varchar(20) not null,
apellido varchar(20) not null,
telefono varchar(20) not null,
direccion varchar(50) not null,
salario int not null,
poblacion varchar(50) not null,
)
alter table camionero add primary key clustered(DNI)

create table Paquete(
codigo varchar(10) not null,
direccion varchar(50) not null,
destino varchar(50) not null,
descripcion varchar(250) not null,
dni_camionero varchar(10) not null,
codigo_provincia varchar(10) not null,
)
alter table Paquete add primary key clustered(codigo)
--
create table provincia(
codigo varchar(10) not null,
nombre varchar(50) not null,
)
alter table provincia add primary key clustered(codigo)
--
create table Camion(
matricula varchar(20) not null,
modelo varchar(20) not null,
tipo varchar(20) null,
potencia varchar(20) null,
)
alter table Camion add primary key clustered(matricula)

create table conduce(
id varchar(10) not null,
f_inicio date not null,
f_final date not null,
matricula_camion varchar(20) not null,
dni_camionero varchar(10) not null,
)
alter table conduce add primary key clustered(id)

--creo las claves foraneas
alter table conduce add constraint fk_conduce_camion
foreign key (matricula_camion) references camion(matricula)

alter table conduce add constraint fk_conduce_camionero
foreign key (dni_camionero) references camionero(dni)

alter table paquete add constraint fk_paquete_camionero
foreign key (dni_camionero) references camionero(dni)

alter table paquete add constraint fk_paquete_provincia
foreign key (codigo_provincia) references provincia(codigo)

--Ejercicio 2

--camionero
insert into camionero values('31760504','Tomas','Rodriguez', '3874077626','Los mandarinos 585', '60000', 'Salta')
insert into camionero values('27790504','Javier','Rego', '3544096456','Los duraznos 408', '70000', 'Mendoza')
insert into camionero values('21633564','Claudio','Mendez', '3774874022','Los Ombues 602', '65000', 'Jujuy')
insert into camionero values('23767804','Hector','Rey', '3349787268','Los Canelos 101', '63500', 'Tucuman')

--provincia
insert into provincia values('1000', 'Salta')
insert into provincia values('1001', 'Jujuy')
insert into provincia values('1002', 'Tucuman')
insert into provincia values('1003', 'Mendoza')

--camiones
insert into Camion values('201560', '2007','','')
insert into Camion values('302055', '2021','','')
insert into Camion values('208907', '2008','','')
insert into Camion values('212076', '2009','','')
insert into Camion values('232891', '2011','','')

--paquete
insert into Paquete values('101','Las Tipas 878','Salta','Paquete de lechugas', '23767804', '1000')
insert into Paquete values('102','Los Tilos 404','Mendoza','Paquete de cebollas', '27790504', '1003')
insert into Paquete values('103','Las Paltas 101','Jujuy','Paquete de morrones', '21633564', '1001')

--conduce
insert into conduce values('01','2000-12-12','2000-12-14','201560','23767804')
insert into conduce values('02','2009-09-24','2009-09-23','212076','31760504')
--delete from conduce where id=02

select * from Paquete
select * from Camion
select * from conduce
select * from camionero
select * from provincia


--3
--a
select UPPER(nombre) NOMBRE, matricula_camion
from conduce c
inner join camionero ca
on c.dni_camionero = ca.DNI
where DNI>20000000

--b
select nombre, DNI, case
	 when salario>10000 then 'categoria A'
	 when salario between 5000 and 1000 then 'categoria B'
	 when salario<5000 then 'categoria C'
	else 'categoria D'
	end
	from camionero

--c
select f_final, f_final
from conduce

--d
select nombre,apellido 
from camionero
where nombre='c%' and nombre='d%' and nombre='m%'