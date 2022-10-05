create database SistemasVentas

use SistemasVentas

create table Proveedor(
RUT bigint not null,
RAZON_SOC varchar(100) null,
DIR varchar(100)not null,
TEL bigint not null,
PWEB varchar(250) null,
FECING date not null,
)
create table Producto(
ID varchar(5) not null,
NOMBRE varchar(20) not null,
PREC int not null,
STOCK int not null,
RUT_PROVEEDOR bigint not null,
ID_CATEGORIA varchar(5) not null,
)
create table Categoria(
ID varchar(5) not null,
NOMBRE varchar(20) not null,
DESCRIP varchar(100) not null
)
create table Venta(
ID varchar(10) not null,
FECHA date not null,
DESCRIP int not null,
MONTO float not null,
CLIENTE_RUT bigint not null,
)

create table DetalleVenta(
ID varchar(10) not null,
PRECIO int not null,
CANTIDAD int not null,
MONTO_UNI int not null,
ID_PRODUCTO varchar(5) not null,
ID_VENTA varchar(10) not null,
)

create table Cliente(
RUT bigint not null,
NOMBRE varchar(20) not null,
APELLIDO varchar(40) not null,
NUMERO_DIRECCION int not null,
TELEFONOS bigint not null,
)

create table Direccion(
NUMERO int not null,
CALLE varchar(100) not null,
COLUMNA varchar(100) not null,
CIUDAD varchar(100) not null
)

--creo claves primarias
alter table Proveedor add primary key clustered(RUT)
alter table Producto add primary key clustered(ID)
alter table Categoria add primary key clustered(ID)
alter table Venta add primary key clustered(ID)
alter table DetalleVenta add primary key clustered(ID)
alter table Cliente add primary key clustered(RUT)
alter table Direccion add primary key clustered(NUMERO)

--creo claves foraneas
alter table Producto add constraint fk_producto_proveedor
foreign key (RUT_PROVEEDOR) references proveedor(RUT)

alter table Producto add constraint fk_producto_categoria
foreign key (ID_CATEGORIA) references categoria(ID)

alter table DetalleVenta add constraint fk_DetalleVenta_Producto
foreign key (ID_PRODUCTO) references producto(ID)

alter table DetalleVenta add constraint fk_DEtalleVenta_Venta
foreign key (ID_VENTA) references Venta(ID)

alter table Venta add constraint fk_Venta_Cliente
foreign key (CLIENTE_RUT) references Cliente(RUT)

alter table Cliente add constraint fk_Cliente_Direccion
foreign key (NUMERO_DIRECCION) references Direccion(numero)
