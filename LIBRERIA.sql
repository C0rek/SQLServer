--Creo la Base de datos de Libreria
Create database LIBRERIA

--Elimino la base de datos
Drop database LIBRERIA 
use LIBRERIA

CREATE TABLE CLIENTE(
codigo int not null,
nombre varchar(20)not null,
apellido varchar(20)not null,
email varchar null,
direccion varchar null,
telefono int null,
)

CREATE TABLE EMPLEADO(
dni int not null,
nombre varchar(20) not null,
apellido varchar(20) not null,
telefono int null,
direccion  varchar null,
)

CREATE TABLE FACTURA(
num int not null,
fecha date not null,
tipo varchar not null,
total int not null,
CodigoCliente int not null,
CodigoEmpleado int not null,
CodigoTerminalVirtual int not null
)

CREATE TABLE PRODUCTO(
id int not null,
descripcion varchar not null,
tipo varchar not null,
formato varchar not null,
precio int not null,
)

--creo la tabla para clasificacion de producto
CREATE TABLE CLASIFICACION(
id int not null,
nombre varchar not null,
idproducto int null,
)

CREATE TABLE LINEAFACTURA(
id int not null,
num int not null,
total int not null,
cantidad int not null,
precio int not null,
NumeroFactura int null,
IDProducto int null
)

CREATE TABLE TERMINALVIRTUAL(
codigo int not null,
nombre varchar(20) not null,
)

--creo las claves primarias
alter table CLIENTE add primary key clustered(codigo)
alter table EMPLEADO add primary key clustered(dni)
alter table PRODUCTO add primary key clustered(id)
alter table LINEAFACTURA add primary key clustered(id)
alter table TERMINALVIRTUAL add primary key clustered(codigo)
alter table FACTURA add primary key clustered(num)
alter table CLASIFICACION add primary key clustered(id)

--creo las claves alternativas
alter table TERMINALVIRTUAL add unique nonclustered(nombre)

--creo claves foraneas
--factura
alter table Factura 
add constraint fkFacturaClienteCodigo
foreign key(CodigoCliente) references Cliente(codigo)
alter table Factura
add constraint fkFacturaEmpleadoDNI
foreign key(CodigoEmpleado) references Empleado(DNI)
alter table Factura
add constraint fkFacturaTerminalVirtualCodigo
foreign key(CodigoTerminalVirtual) references TerminalVirtual(codigo)

--Linea Factura
alter table LineaFactura
add constraint fkLineaFacturaFacturaNumero
foreign key(NumeroFactura) references Factura(num)
alter table LineaFactura
add constraint fkLineaFacturaProductoID
foreign key(IDProducto) references Producto(ID)

--Clasificacion
alter table Clasificacion
add constraint fkClasificacionProductoID
foreign key(IDProducto) references Producto(ID)

--agrego checks para dominios
alter table Producto add check (Tipo in('Libro', 'Revista', 'Novela'))
alter table Producto add check (Formato in ('Digital', 'Impreso'))
alter table Clasificacion add check (Nombre in('Politica', 'Niños', 'Informatica', 'Universitarios'))

--creo indices
create nonclustered index ixClienteID on Cliente(Codigo)
create nonclustered index ixFacturaNum on Factura(num)
create nonclustered index ixClasificacionID on Clasificacion(ID)
create nonclustered index ixProductoID on Producto(ID)
create nonclustered index ixLineaFacturaID on LineaFactura(ID)
create nonclustered index ixTerminalVirtualCodigo on TerminalVirtual(Codigo)

--borro indice
drop index ixClienteID on Cliente

--agregar un campo que considere apropiado
alter table Cliente add Socio bit not null

--eliminar el campo agregado
alter table Cliente drop column socio

--crear Tabla Cliente_test
select * into Cliente_test from CLIENTE

--eliminar tabla
drop table Cliente_test
