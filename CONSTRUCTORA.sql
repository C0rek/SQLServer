--creo la base de datos de constructora
create database CONSTRUCTORA

--uso la base de datos
use CONSTRUCTORA

--creo las tablas
create table OCUPACION(
codigo varchar(2) not null,
nombre varchar(20) not null,
)
create table EMPLEADO(
cuil VARCHAR(13) NOT NULL,
dni int not null,
nombre varchar(50) not null,
apellido varchar(50) not null,
direccion varchar(200) not null,
telefono varchar(20) null,
)
create table MAQUINA(
ID varchar not null,
nombre varchar(50) not null,
fechaCompra date not null,
)
CREATE TABLE dbo.EMPLEADO_temp(
cuil VARCHAR(13) NOT NULL,
nombre varchar(50) NOT NULL,
apellido varchar(50) NOT NULL,
direccion varchar(200) NOT NULL,
telefono varchar(20) NULL 
) 
go
create table POSEE(
ID varchar not null,
CodigoOcupacion varchar(2) not null,
CUILEmpleado varchar(13) not null,
fecha date not null,
cantOcupaciones int null,
)
create table OBRA(
ID varchar not null,
nombre varchar not null,
tipoObra varchar not null,
inicioObra date not null,
finObra date null,
)
create table ASIGNADA(
ID varchar not null,
IDObra varchar not null,
IDMaquina varchar not null,
inicioMaquina date not null,
finMaquina date null,
)
create table TRABAJA(
ID varchar not null,
CUILEmpleado varchar(13) not null,
IDObra varchar not null,
inicio date not null,
fin date null,
)

--creo claves primarias
alter table OCUPACION add primary key clustered(codigo)
alter table EMPLEADO add primary key clustered(cuil)
alter table MAQUINA add primary key clustered(ID)
alter table POSEE add primary key clustered(ID)
alter table TRABAJA add primary key clustered(ID)
alter table OBRA add primary key clustered(ID)
alter table ASIGNADA add primary key clustered(ID)
	
--creo claves alternativas
alter table OCUPACION add unique nonclustered(nombre)

--creo claves alternativas
alter table POSEE
add constraint fkPoseeOcupacionCodigo
foreign key(CodigoOcupacion) references Ocupacion(codigo) 
alter table POSEE
add constraint fkPoseeEmpleadoCUIL
foreign key(CUILEmpleado) references Empleado(cuil) 
alter table TRABAJA
add constraint fkTrabajaEmpleadoCuil
foreign key(cuilEmpleado) references Empleado(cuil)
alter table TRABAJA
add constraint fkTrabajaObraID
foreign key(IDObra) references Obra(ID)
alter table ASIGNADA
add constraint fkAsignadaObraID
foreign key(IDObra) references Obra(ID)
alter table ASIGNADA
add constraint fkAsignadaMaquinaID
foreign key(IDMaquina) references Maquina(ID)

--inserto OCUPACIONES
INSERT OCUPACION(codigo, nombre) VALUES ('EL','ELECTRICISTA')
INSERT OCUPACION(codigo, nombre) VALUES ('PL','PLOMERO')
INSERT OCUPACION(codigo, nombre) VALUES ('OA','OFICIAL ALBAÑIL')
INSERT OCUPACION(codigo, nombre) VALUES ('AA','AYUDANTE DE ALBAÑIL')
INSERT OCUPACION(codigo, nombre) VALUES ('PI','PINTOR')
INSERT OCUPACION(codigo, nombre) VALUES ('AR','ARQUITECTO')

--inserto Maquinaria
INSERT MAQUINA(ID, nombre, fechaCompra) VALUES('1','Cargadora Retroexcavadora 315 SL','2014-07-02')
INSERT MAQUINA(ID, nombre, fechaCompra) VALUES('2','Mini cargadora  CAT ','2010-03-15')
INSERT MAQUINA(ID, nombre, fechaCompra) VALUES('3','Cargadora de Oruga CAT','2000-01-03')
INSERT MAQUINA(ID, nombre, fechaCompra) VALUES('4','Aplanadora  VG201','2011-11-05')
INSERT MAQUINA(ID, nombre, fechaCompra) VALUES('5','Camión Articulado CAT',getdate())
INSERT MAQUINA(ID, nombre, fechaCompra) VALUES('6','Soldadora Alógena',getdate())

SET NOCOUNT ON 
INSERT EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('20-31948586-5','Pablo','Del Pino','Benito Gaña 256','4315627')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-28261328-5','Jorge Ricardo','Flores','Santiago de Liniers 2376','0387-154661301')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('23-26030310-4',' Gabrielal Lorena','Quinteros','Radio Patagonia 2721 B° Intersindical','4243663')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-17750197-8','Mary Isabel','Callejas','pje ituzaingo 60','3,87316E+11')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-29628799-2','María Cecilia','Pérez','Juan Larrea 525. Villa Saavedra','(03873) 15614979')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-31948957-1','Carolina Magali','Rodriguez','Capuchinas N° 18 - B° las Rosas','4280191')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('20-31338115-4','Facundo Ruben','López','Bº Santa Ana III Mz. G   Casa 5','(0387) 4290837')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-27571714-8','Marianela','Sanchez Hulet','Pje Zorrilla Nº 161 - Salta','4316302')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('20-30099875-6','Nicolas','Alonso','9 de julio 112','3,87155E+11')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('20-29409729-6','Jorge Eduardo','Tolava','Alvear 1028 Barrio 20 de febrero','0387-4214503')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('23-31873369-4','Mirian Raquel','Otero','9 de julio nº 705','(03876)420436')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('20-28712343-5','hugo','palermo','25 de mayo 462','03876-15667606')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-30118562-1','María Fernanda','Iriarte','Melchora F. de Cornejo Nº 40','03876-481561')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('20-32455294-5','Luciana Maria de Lou','Cruz','Alejandro Gallardo N° 231','0387 4271604')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-22557150-9','Natalia','Pacheco','Melchora F. De Cornejo N°429-Rosario de la Frontera-Salta','03876-481108')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-27519120-0','Virginia','Alonso Gudiño','Salta - Capital','0387-155178817')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-28887626-1','Adriana Angélica','Chaile','Entre Rios 729  7 ° P. DPTO. 43','3,87155E+11')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('20-26967223-5','Luis Alejandro Ruben','Campoccia','Aniceto Latorre nº 208, dpto. 1º piso "A"','4398980')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-24338619-0','GABRIELA','ADET','ISLAS MALVINAS 47','154060030')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('20-29545851-9','Nicolas','Montaldi','Bº El Huaico, manz 525 A, casa 12','3875718403')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-30221217-7','FATIMA','HOGNADEL','PARAGUAY 1584','3875823055')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-30674696-6','MARIA EMILIA','SILISQUE','LOS ABETOS 570 (TRES CERRITOS)','0387-154829103')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('20-17581951-8','FEDERICO','DIEZ','Bº PORTAL DEL CERRO CASA 17','4258000')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-26876161-1','Andrea Estefania ','Gonzalez ','LAS MOJARRAS N° 75 BARRIO EL  MIRADOR ','3876482056')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-31518910-7','Vanesa Claudina','Herrando','Lavalle N° 129','3,87615E+11')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-21316428-2','SILVIA LILIAM','VERA','SAN MARTIN Nº 08- CENTRO','03876-483103')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-25571539-4','MARIA FERNANDA','JORGE ROYO','Pasaje Enrique Torino Nº 1966','3,87155E+11')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-14500216-3','SUSANA ','REDONDO TORINO ','Pje. San José 30','03876-15412251')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-29174406-6','Marcela','Rojas','Block 25, 1º piso, dpto. "B". Bo. Pque. La Rural','155388848')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-25735988-9','María Soledad','Filtrin Cuezzo','López y Planes 687','03878-15582090')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-21318571-9','Liliana Francisca','Valle','Block 37 G Planta Baja Parque La Vega','Interno 1054')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('23-18814848-4','Celina','Morales Torino','Mzan 442 C - casa 5','4965567 - 154083777')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-27544519-9','Nadia Lorena','Cruz','Carlos Fores 925 - La Madrid','154028487')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-21633742-0','Mercedes','De la Cuesta Aráoz','Calle 3 - 59 - Barrio Alborada - Grand Bourg','4361064')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-27571604-4','Maria Cecilia','Flores Toranzos','Los Naranjos 56 - Tres Cerritos','155089762')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-29817011-1','MARIA DEL HUERTO','RUIZ','PUEYRREDON ESTE 93','3876435888')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('20-27455479-8','Ramiro Hernan','Ramos Ossorio','Los Robles 30','3874553958')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('20-30906545-0','Elisa Viviana','Perez','Bolivar 475 - 7 "D"','3874150088')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-32365152-9','MARIA DEL MILAGRO','HERRERA','BALCARCE 449','(0387) 4-211371')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('20-14856306-4','Victor Walter ','Clark','Francisco Beiro 939 Bº Grand Bourg ','4362151')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('20-24069085-4','Leandro Joaquin','Flores','25 de Mayo 845 Depto B','3031')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('20-27327734-0','Marcos Arturo','Vega Ortiz','santiago morales Nº 726','155011573')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('20-27034776-3','HECTOR SEBASTIAN ','GUZMAN ','Cafayate Nº 118','03876-15472890')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('20-14747496-3','CLAUDIA ESTHER','PAREDES','BLOCK 13 - DPTO. 15 - EL BOSQUE','0387-156851747')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('20-12957512-4','Mónica Celia','Corrado','Avda. Sarmiento Nº674 1er. piso dto 18','4224602')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-30222661-5','Claudia Geraldina','Abraham','Pueyrredon 980 4º C','387 155 336 456')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-26784641-9','MONICA SUSANA','POMA','SANTIAGO DEL ESTERO 611','4953073')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('2718019777-5','Nancy','Valencia Donat','Sarmiento 439 San Lorenzo','387')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-29738920-9','MARÍA JORGELINA','BRANDON SUÁREZ','','')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('23-14104908-9','Sergio Osvaldo Ramón','Castellanos','25 de Mayo y Buenos Aires','03876-15669534')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-23584778-2','María Luján','Sodero Calvet','Avda Bolivia 5436 Salta','3062')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-25885069-1','Macarena','Jovanovics','pje. malvinas 1581','3874499566')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-31548340-4','Maria Soledad','Sirena','Pueyrredon Nº 1147 Salta','156858644')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-24991737-6','Maria Eugenia','Guzman','calle Cordoba Nº 241 Salta','387-155835284')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('20-143295215','ARMANDO','CAZON','','')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('20-17355527-0','JUAN MANUEL','SALINAS','Jose I. Sierra 903','03876-15472290')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-26701970-9','Silvia Liliana','Paliza','av. bolivia','3,87155E+11')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-18570298-2','MARIANA','TORRES','ALVARADO 1127','15436689')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-30222138-9','Daniela Emilse','Orsilli','marocco 1780 - B° Periodista','0387-156830756')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('20-24217083-1','Gustavo Víctor Ariel','Torres Rubelt','Bº Univ. Católica - Mzna. 542c - Casa 1','0387 - 155337186')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-20707555-3','Cecilia','Cardozo','Av. Bolivia 4671','2101')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-22637486-3','Paola Alejandra','Linares Morón','Arenales 801','03878-421735')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-29829191-1','Valeria Alejandra','Garcia','San Martin 353, dpto B 3','03876 15411592')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('23-17958647-9','Carmelo Eduardo','Paz','Ministerio Público Metán','03876-15667565')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('20-16080768-8','Enzo Ruben','Giannotti','Av. Los Constituyentes Nº1159','03878 15409522')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('20-28013577-2','Natalia Vanessa','Pettit','Bº1º de Mayo Manz F Casa 14','03878 15362843')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-29251502-8','Candelaria','Lopez Saravia Toledo','Mitre ( e) Nº 57','3,87616E+11')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-24324876-6','Norma ','Palomo','24 de Septiembre 475','3,87316E+11')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-25829679-1','LAURA INES','SABHA','RUTA NAC. Nº 34 - KM. 1428 - GRAL. E. MOSCONI','03873-15521317')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-23520026-6','SILVINA JUDITH','PUIG','Rio Piedras  OESTE 88','3,87615E+11')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-28260839-7','Patricia Ines','Uchino','Acevedo 281','0387 155772855')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-29116144-3','Monica ','Saravia','SAN MARTIN Nº 158','3,87615E+11')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('30-61489628-7','Andres Sebastian','Reinoso','cornejo Nº 182','4396392')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-27910675-5','Andrea Carina','Maidana Lopez','Cornejo Nº 869','03873-15592337')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-25437401-1','Gabriela Noemí','Filsinger','Cornejo 319','3873447146')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('20-22146745-1','Julio César','Brandán','Bs. As. (O) 34 Bº AATRA','3876556770')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-26930218-1','Gabriela','Geronimo','Bolivia 172 - Orán Salta','3878610606')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('20-24167483-6','Mariano','Abeyá ','Juramento 339','3874071708')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('20-28900447-6','Maximiliano German','Correa','20 de Febrero Nº270','03878-15558520')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('20-21310489-7','Horacio Guillermo','Córdoba Mazuranic','Eucaliptus 680 - 3º - 17','4953470')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('20-20931401-1','Luis Gerardo','Veliz','juan manuel de rosas nº 30','03873-15408009')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('20-20877224-5','Juan José','Andreu Emran','1 de Mayo 473 Barrio Los Payos','0387-15640951')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('20-23461497-6','JUAN SEBASTIAN','LLORET','Avda Bolivia 4671','5012')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('20-17175895-6','Jorge Rolando','Colque Cortez','Arenales 398','3875093499')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('20-23557622-9','Claudio Alejandro','Parisi','alberdi 425','03878 15438811')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-22531013-6','Paola Elizabeth','Anders','lavalle 529','3,87615E+11')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('20-17549310-8','HECTOR FABIAN','FAYOS','PJE. JOAQUIN CASTELLANOS 223','03878-425638')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('23-23271532-4','Mariela','Torres','barrio docente','3878459335')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-32605505-6','Paula Victoria','Baccaro','los Ceibos 20 Tres Cerritos','3875346709')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('20-29409697-4','Julio César','Cervante Romero','BLOCK 8 DPTO. 103','154659302')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('20-26485001-1','Martin Francisco','Cobos Herrera','126 Viv. block "L·" 1º piso 6','3,87156E+11')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-22428632-0','María Magdalena ','Albarracín','las paltas 187','3875390729')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('20-24804194-4','Mariela delosAngeles','Muiños','Urquiza 536','3074 4228946')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-21828177-5','Paola','Peretto','Rivadavia 908 4 C','4329181')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-32630115-4','Maria Belen','Ana Dobratinich','Isalas Malvinas 62','156056135')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('20-32630141-9','Enrique','Solá Figueroa','Rivadavia 306','4223154')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-28543791-7','nilda carolina','carrizo lopez','VIRREY TOLEDO 158','154-690047')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('23-26804480-9','María Edith ','Rodriguez','Los eucaliptus 397','3874157849')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-32365763-2','Constanza','Villamayor','Teniente Luis Fuentes 750- Portezuelo Norte','0387-155177445')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('20-25193333-3','Sebastian','Monteros','Bolivia 172','03878-15549373')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('20-18230769-7','Sergio Francisco','Dioli','Av. Bolivia 4671','154096409')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-28050724-0','VANINA SOLEDAD','PEDRANA','Moreno 946','03878-15583808')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('23-13701263-4','Martha Graciela','Lopez','Casa 23 - Barrio Parque el Aybal','4241942')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('23-31948930-4','Lucrecia Ines','Moreno Fleming','Calle Del Milagro 79','0387 155 199 402')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('20-30836447-0','DIEGO NICOLAS','RODRIGUEZ LOPEZ','PJE. QUEBRACHAL Nº 153','03876 15441694')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('20-26565249-3','Guillermo Mauricio','Alberto','Laprida 770','4228255 155896972')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('20-21013675-5','Luis Alberto','Solórzano','Gorriti 521 piso 4 depto A- Tartagal- Salta','03873- 424575')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-21943628-4','Claudia Viviana','Yance','Gorriti N° 521 piso 4 depto A- Tartagal-','3873424575')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('20-25090426-7','Silvia  Cristina','Ruiz','20 de febrero Nº 257','3878-612206')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('20-14329575-4','NOEL ANGEL','ZARATE','Los Paraisos 323','154023373')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-20232598-5','MARIA DEL CARMEN','NUÑEZ','Alvarado 469','03878-15430026')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-18187089-9','Gabriela Maria','Buabse','Avda Bolivia 4671','0387 155298987')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-22785393-5','OLGA SILVINA','ROMERO','CASEROS 212 1 PISO "A"','155700526')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-33378613-9','María Alejandra','Martos','Los Bardos 583- Grand Bourg','4361718')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('20-25122063-9','Luis Angel','Salva','Calle General Güemes 1688','154796333')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('23-30190772-9','Jorge Luis','Musa','Sarmiento 640','3878423667')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-30222811-1','Sandra Elizabeth','Decima','Pje del Temple 436','4236802')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-28261526-1','Marcela Leonor ','Amiri','20 de febrero 343 7 "A" ','15-4-581670')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-33979516-4','DANIELA NATALIA','SULCA','Mar Arabigo 977 B° Pablo Saravia','0387-4271885')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-31848340-5','MILAGROS','WARD','ARTURO TORINO 1360 - B° LOS PINOS I - GRAND BOURG','4365410')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-33046664-8','Ana Carolina','Vanetta','Territorio de Misiones Nº 2709. Bº Intersindical','4240120')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-27972553-6','Mariana','Fleming','Manuel Dorrego 1370 San Lorenzo','4922270')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-32347675-1','Mariana Soledad','Soto','B° Bancario Los Crdenales N° 4.533','4-248795')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-28634977-9','ROSALIA VICTORIA','CUESTAS','MARTINA SILVA DE GURRUCHAGA 62','4390606')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('20-27972449-7','Gonzalo Angel','Gomez Amado','B° Alborada calle 5 casa 83,Grand Bourg','4360643')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('23-29337153-9','Federico Gonzalo','Valé','Catamarca 1197','155 360470')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-21542910-0','Gabriela Mabel','Rodriguez','Block 8 depto 3 PB. Barrio El Bosque','156112714')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('23-32347211-4','Luz María','Raya Lavín','Santiago del Estero Nº 951','4-221326')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('20-34311708-7','JERONIMO ','CASTELLANOS','25 DE MAYO 402','03876-15411549')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('23-28945915-4','LOURDES YANINA DE LOS MILAGROS ','ABREGU','PUEYRREDON ESTE 93','3,87615E+11')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-27631771-2','Carina','Gonzalez','pedro de valdivia 654','3874280253')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-25517882-8','Debora Lis','Schinardi','caseros 231','3876135521')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-16000303-6','Guadalupe Yolanda','Delgado','cordoba 1389','154105650')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-27694409-1','Angélica Adriana','Gonzalez','RIVADAVIA 1064 ','155055430')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('20-20796246-6','Federico Jorge','Mateos','Alsina Nº 318','154155955')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-32856685-6','SILVINA PAOLA','SUAREZ','Los Durazneros 1225 Bº Tres Cerritos','0387-154145837')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('20-35477873-5','Joaquín Emilio','Tejerina Peralta','Avenida Paraguay 1239','387-154085336')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-31194405-9','Viviana','Angel','CASEROS 1567','154101464')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('23-22637359-4','Julia Elizabeth','Arias','Bº GRAL ARENALES CALLE ERNESTO CLERICO 20','154574982')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-31194958-1','natalia guadalupe','garcia','Bº Bancario block n2 3piso dpto b','387.154.141.399')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('20-29293057-8','Juan Pablo','Canetti','Poder Judicial','03888-15607111')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-18674118-3','Ma. de los Angeles','Alcaraz IlCámara','Manzana Aq 6 Block 11 Bº 100 Viviendas Grupo B','3888420176')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-23749196-9','Ana Gloria','Salomon','Pje Libertad 50','0387 154652758')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-30636333-1','Amalia Maria','Montolfo   Rodriguez','Alberdi 746 Dpto 15','0381-155625890')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-22557566-0','Mónica Liliana','Roman','manz. B casa Nº6 Bº los inmigrantes','03876-15662900')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('2733378709-7','ROCÍO ','GARCIA JARSUN','25 de Mayo 443','15505115')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('23-25078715-4','Edith','Herrera','Los Andes Nº 1573 Bº Recaredo','03873-15522635')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-24145794-5','MARIA ISABEL','PRADOS FERNANDEZ','25 de Mayo 205','03876-15400004')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('20-17549430-9','SERGIO LEONARDO','VELEZ','Arenales 570','3878456976')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-24266180-5','Beatriz Alejandra','Jalith','Araoz Nº 90','0387-154672311')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-27097891-1','MILAGRO REBECA CAROLINA','SARAVIA','Salta (E) 161','03876-15539256')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('20-27426510-9','JOSE ALEJANDRO ','PALIA','Santa Fe (O) Nº 65','03876-15475553')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-18034390-9','GILDA NOEMI','DALDOSS','Canton 169- Villa Manuela','03876 483750')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-18518155-9','angelica marcela','tejerina','Pje Guerrero Nº 7','3,87815E+11')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('20-22119124-3','Carlos Walter','Escajadilla López','Pje. Gerardo López 151','3876424528')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-18470035-8','Mabel Adriana','Colque','Bº Los Molles manz. 531 A, casa 14','0387-155018120')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-24875569-0','Leda Guadalupe','Lamas','Ituzaingo 87','0387-155329197')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-32504225-2','María Florencia','Toledo','Avenida Libertad 162','(03876)15412092')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('23-35044098-4','AGUSTINA','RIZZOLI','','3874581725')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-21942647-5','ANA MARIA ','GARCIA ','San Luis 422','3,87615E+11')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-13771533-9','NELLY','FLORES ','Pje. Tartagal 118','03876-15520842')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('20-23545367-4','ROLANDO','SAVALL SOTO','','')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('20-30118677-1','JOSE OSCAR','OTERO','rEP DE BRASIL nº 202','3876453636')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('20-26627593-6','MARTIN ','DE BUSTOS','Manzana 531 B Casa 2 - El huiaco','4240399')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-23015120-8','Silvia Beatriz','Olivera','pasaje belisario lopez 1171','3815 125519')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-32090264-4','ANA EVANGELINA','SANDOVAL','CIRO ECHESORTU 196','03873-15 634241')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('20-28261261-6','Santiago Jose','Lopez Soto','Los Mandarinos 205','0387-155080319')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-29335462-1','Fabiana Soledad','Ancieta','Corrientes 789 1° piso','4230782')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-13567834-7','Maria del Milagro','Vega','sarmiento 507. 5° piso "C"','383-154541252')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-26030800-4','María Lorena','Frola','virrey toledo 104','387-4320808')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('23-27681628-4','MARINA GUADALUPE','CHEDA','TUCUMAN 582','4231232')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-17113976-2','Marcela de los Angeles','Vega','Ayacucho 720 -6° piso "D"','383-154600185')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-12790888-0','Mabel Rosa','Ledesma','Cánepa Villar 145- Vª Los Tarcos','4999245')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-27973319-9','Laura Gabriela','Flores Maita','Barrio Santa Victoria Nº 510','387- 156123836')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-24875798-7','Cinthia Vanina','Zamora','B° parque gral. belgrano-2da etapa- mzana A- casa ','155 023353')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-28261343-9','MARIA LAURA','TORREZ','Alvarado 1139 of 1','3874677662')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-31194011-8','Natalia Soledad','Vaca','Bº Castañares Grupo 200 Pasaje Pichanal Nº59','3,87155E+11')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-18572994-5','Nancy Noemi','Troichuk','av. sarmiento n° 1146','03876-15475558')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-29917558-3','Romina ','Merin ','calle Cervando Leal 185- Barrio Ana Maria','03876-15448950')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('20-30090837-4','Fernando Andres','Vidal','calle antonio alice N° 53 barrio  Hipolito Irigoye','03876-473600')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-28892832-6','GABRIELA','FLORES TORRES','ENTRE RIOS 784','0387-154746811')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('20-22676141-2','Eduardo Arturo','Barrionuevo','Avda Bolivia 4671','0387 154571819')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-31035396-0','CINTIA MACARENA','MAGNO','GRAL. RACEDO 1096. B° CIUDAD DEL MILAGRO','0387-155145034')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-25662284-5','Débora Natalia','Fuentes','Manzana 532 A Casa 28 B° El Huaico','3874581969')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-94790993-8','Giulia','Parente','Adolfo Guemes 325 5° A','3875861767')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-11538695-1','Maria Genoveva','Valdemarin','B° Castañares grupo 234 block L Dpto. 12','0387-154466310')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-27321448-3','Alejandra del Milagro','Barberis Ladewski','islas malvinas 940','03876-15666581')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('30-71172334-6','ANA LAURA','RUFFINI','14 Nº 1875','2302630681')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('20-10773459-8','CARLOS RUBEN','EVELING','Mza.A513 Casa 10 Bª UCASAL','3,87156E+11')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('2733047630-9','Eliana Cecilia','Bellassai','Rivadavia 878','3876 455802')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-26963407-9','Micaela','Herrera','Lima 341','2,49154E+11')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-23796619-3','MARIA DE LAS MERCEDES','BALESTRINI','Galicia 2635 Barrio Colon','0351 152417200')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('23-10200328-4','ESTELA G.','ANDRADES','Billinghurst 879, Dto 5°','155-052-6488')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-11634693-7','Graciela Alicia','Bugeiro','Paraguay 1536, 1° 19','1148113438')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('23-11724691-4','Marcela','Sanchez','cordoba 1156 6to A','1,11542E+11')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-27564614-3','Mirta Luján','Devesa ','Dean Funes 3210. Bº Lamadrid','3,87155E+11')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-25064842-7','maria elisa mabel','vilca','avda. bolivia 2571','388-4231079')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-27176529-6','Beatriz Estefanía','Guevara','Av. Bolivia 5150','387-154112681')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-27974271-6','Susana de los Angeles','Guzman Gonzalez','Av Ejercito Arg.dpto16 BlockL BºCdad del Milagro','3875905076')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-22569538-0','Liliana Milena','Boglione','Cornejo 182 PA','3,87315E+11')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('30-70962154-4','LILIANA','MAGRINI','arias 4491','45412410')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-11958253-4','Maria Teresa','Muñoz','Laprida 642 10 D','3815042311')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('24-33388432-8','Mariana Andrea','Gamba Cremaschi','Brealito 210','3874525438')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('2331193407-4','Yanina','Salim Acuña','Las Heras 1325','156830634')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('20-17791936-6','JAIME BENJAMIN','LOPEZ FIGUEROA','Bº Las Leñas 1- casa 15','0387- 4360681')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-25086814-1','maria fernanda','sarmiento','tucuman 154','4235423')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-20232187-4','Maria Alejandra','Alberstein','Belgrano 1822','3,87154E+11')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-22515654','MARIA ELISA  ','GALLO','ROCA 303- 3ª A','0381-155184506')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-23549034-5','Andrea','Lucero','Pje Frías 395','03868-15404055')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-27168084-3','Noelia Elisandra','Perez','Mzana 555 A casa 1 Bº Universidad Catolica','4710145')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-13414693-7','Sonia Elizabeth','VALDIVIA','Simón Bolívar 556','0387-154734743')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('20-20609759-1','Eduardo Luis Cayetano','Alvarez','Arturo Oñativia 227','154044441')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-29483986-6','Liliana Esther','Tasca','Rivadavia Nº 208','387-5766460')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-23079331-5','Jorgelina','Cornejo Giussani','Deán Funes n° 119','0387- 4214139')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-25885716-5','Analia','Vergara','Pueyrredon 926-8º E','0387 154569539')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-17581568-1','ELENA CECILIA','SANCHEZ OSADCIA','25 DE MAYO Nº 527','03876-15666908')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('23-26030615-4','María Pía','Blesa','Gral. Guemes 1551 (Laboral)','154156005')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-14902414-5','Gabriela Inés','MORELLI','Avda. Cabildo 3067 4º','011-4163-8415')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-26627128-5','MARIA INES ','PIEVE','Los Carolinos 275 - bº tres cerritos','3,87155E+11')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-32452952-2','ANABEL NATALIA','HUANCA','Coronel Arenas 428 bº Centro- Perico- Jujuy','0388-154961005')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('20-17308648-3','JUAN PABLO','DURAN','PERIODISTAS NEUQUINOS N°128','0299 155031911')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-13066607-3','Stella Maris','Moreno Perea','2 de abril 337, 8 piso,84 of.','381-155885698')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('20-12148263-1','Pedro','Roldan Vázquez','Cayetano Rodriguez 76','381-154135202')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('30-68130451-3','SILVANA NIEVES','LIENDRO GIMENEZ','10 de  Octubre 474','154793964')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-10552893-6','Norma Elsa','Avila','Pje Garibaldi nº 55 Planta Alta','0381-156092550')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('20-18692118-7','Orlando V.','Stoyanoff Isas','Pje. Vélez Sarsfield 450 - PB','3,81157E+11')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-30828922-8','ivone solange','artur de la villarmois','los pinos 89 B° Jardín','3888-15453605')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-31548595-4','CONSTANZA','SARAVIA ','Avellaneda Nº 517','011-1557362965')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-20125286-0','ERICA ALEJANDRA','ALFARO','LOS GLADIOLOS 246','4280529')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-16128441-1','maria alejandra','chaya','Bº parque Belgrano','3,87154E+11')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-13674250-2','Luisa Liliana','Cardozo','Avda. Bèlgica Nº 1481','0387-154420548')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-18366963-5','zulma alejandra','arepiaq','mitre 550','0387-155031568')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('23-23239152-9','JUAN MARCELO','ZELAYA','AV BELGRANO 450','0387-155376971')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('20-12384369-0','Buenaventura','Duarte','Pellegrini 1050 - 1º piso','03794-476866')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('30-99907040-6','NATALIA ROMINA','DEFFIS ','MARIANO MORENO Nº 730 2º PISO','0376 154657068')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-21327671-4','Claudia Viviana','Sales','Aniceto Latorre 1221','156836513')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-30916082-2','maria ines','rivolta','gabriel pulo 40','155760101')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-05869188-2','MARIA','VARGAS','WARNES 445','3,87315E+11')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-28886596-0','EMILCE ELEONOR','ARMELLA','B° CASTAÑARES MANZ. 6- LOTE 4 GRUPO 298','154529318')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('23-20706425-4','Silvana Elena ','Moreno','Mza 53 B- casa 21- Bº Asociacion de Ingenieros','0387-155 822406')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('23-31371624-4','Mirna Mara Belen','Tolaba','Avda. Uruguay 401 ','3,87155E+11')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-17135004-8','Monica ','Descals','Pje San Lorenzo 134','3,87154E+11')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('20-28543134-5','Martin Nicolas','Montero Bandur','los algarrobos 171 B° tres cerritos','3875960331')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-13347514-7','Graciela Remedios','Suyo','Manzana "C" Casa 09','3,87154E+11')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-28886155-8','ana gabriela','robles wierna','los algarrobos 171 B° tres cerritos','3874098660')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-33046865-9','jacqueline','manoff','apol. s. 106','0387-154821854')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-24697872-2','Soledad','Arechaga','Bº El Huaico','155319591')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-30635511-8','Analia  Verónica','Macías','Danilo Bonari Nº 1320','154-068756')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('2727640697-9','Elizabet Andrea','Villarreal','Alvarado 830 dpto A','154589435')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('23-24998202-4','María Fedra','Aimetta','Av. Bolivia 5150','0387 155954794')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-11708293-3','Marta','Palazzo','Lamadrid 455 PB','0381-')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-06535651-7','ESTHER JULIETA','VALDERRABANO','AV. SARMIENTO 309','0381-4211704')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-30150606-1','ANGELICA GRISELDA','SOLIS','Juana Manuela Gorriti 559','0388-154077847')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-24578703-6','Maria Nazaret','Rodriguez Ponce de León','Caracas 2231','3,81156E+11')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('3071165519-7','Jimena','Vallejo Morales Miy','Sgo del Estero 165 2 A','0387-155102292')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('30-71165519-7','Claudia','Boyanovsky','Azcuenaga 163','3815619045')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-20707359-3','TANIA','NIEVES KIRIACO','ameghino 310','4211724')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('30-99916499-0','Dora Mercedes','Coria','Puerto Madryn N° 15','3854223551')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('30-67151402-1','Monica Isabel','Cruz Martinez','Remedios de Escalada 157 ','3886863582')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-10251606-6','Alicia','Ramos','Los Tilos Nº 62','3874395823')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('23-6194029-4','Violeta','Carrique','Chiriguano 8 - Bº Parque Gral. Belgrano','0387 4250065')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-18432653-7','Raquel','Barrionuevo Merlani','','')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('20-21665805-2','Alfio Gabriel','Ruiz','','')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('23-38738978-4','MARCIA AGUSTINA','MAITA','','8132')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-38652118-8','MARIA PAULA','PEÑA','','')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('20-35543405-3','RAMIRO Marcos','CANAVIDEZ TOLEDO','','')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('20-37900139-5','MIGUEL MAXIMILIANO ','FLORES','','')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('23-29586371-4','MARÍA DEL MILAGRO','NIEVA','','')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-25122926-6','Patricia','Abad','Las Rosas 85 - Tres Cerritos','3874395308')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-24875465-1','Patricia Sandra','Camacho Baldiviezo','Finca la Verbena s/n Camino a Cienega','3874168075')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-30725327-0','Silvana Andrea','Zenobio','Litoral de Sta Fe 2263 - El Tribuno','4241587')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-28633523-9','Lidia Cecilia','Bordon','Bº Santa Ana I, Calle 5 casa 1284.','3874290899')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('20-32365887-1','María Eugenia','Lopez Ahanduni','Barrio El Peridista Gambolini N° 1844','4244841')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('20-27571709-7','juan ramiro','carrizo lopez','Mza. 36 casa 17, B° San Carlos','387-5538400')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('20-32852973-5','Mario Luciano','Boglioli','Radio Colon N° 2577 B° Miguel Araoz','3,87154E+11')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-27189690-0','Natalia Carolina','Otero','Cnle. Pringles N° 622, B° Grand Bourg, Salta Capital','4369650')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('23-27911216-4','Jorgelina del Carmen','Yellamo','Ortiz de Ocampo 1029 C del Milagro','4255114')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-33753755-9','Maria del Rosario','Teyssier','Los Pinos 11','5,43876E+11')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-29164704-4','María Martha','Botelli','','3874242475')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('20-29164592-6','Edgardo Wlifredo','Torrejón','Martina Silva de Gurruchaga Nº 62 Vº Belgrano','4390606')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-31948498-7','Macarena Beatriz','Saravia','','')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-32805662-9','Maria Laura','Saravia','Pasaje Carlos Costa 51','4318579')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('20-27455783-5','Federico','Jovanovics Torino','','')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-25571187-9','Veronica','Simesen de Bielke','','')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-20232411-3','nelly','gimenez','españa 2125','4223040')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('20-28851808-5','Pedro Javier','Arancibia','','')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('20-18230927-4','Juan Rito','Arévalo','','')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-23721297-0','Alicia','Dastres','manzana 517 B casa 11 BarrioelHuaico','387 4956423')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-25884243-5','Claudia Patricia','Narváez','Pje. Maestra Benigna Saravia 367 - Villa Estela','0387-4230118')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-25801584-9','Veronica','Cavolo','','')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('20-38740591-8','Jorge Armando','Torres','B Juan Manuel de Rosas Mzana Q lote 24','0387-155405686')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-37190024-7','Florencia','Morales Torino','','')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-26030617-6','MARIANA','LACONI','','')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-30175804-4','Daniela','David','','')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-34885857-8','Ayelen','Donadio','','')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('20-35822169-7','Fernando','Salinas','','')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-39675929-8','Florencia Beatriz','Luna','','')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-38215157-2','Luciana Antonella','Tirao Torrejon','','')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-37203256-7','Mariela Micaela','Borja','','')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-38340769-4','Maria Virginia','Guanca Baspineiro','','')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-39539969-7','Noelia Lucrecia','Coronel','','')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-35477900-0','Mónica Belén','Roldán','','')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('20-37163221-3','Brian Alvaro','Figueroa','','')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-29336101-6','María Agustina','De la Cuesta','','')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-28261756-6','Amparo','Torres Revol','','')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('20-35104653-9','ANDREA GIMENA','PEÑALVA','','')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-34190488-4','Luz Maribel','Vidaurre Gonzales','','')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-25090537-3','mariana','sallent garcia','alvarado 1808','4712538')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-33753145-3','Maria Celeste','Morales','13 DE JULIO N 39 - PORTEZUELO NORTE','')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-33753506-8','Belen Margarita','Rodriguez Alzogaray','mendoza 1698','4- 216719')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('20-32546699-6','Juan Federico','Flores','Avenida Jujuy 770 Primer Piso  ','4232150')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-29737914-9','Miriam Natalia','Quipildor','Mzana 26 - casa 1 Grupo 648 - B Castañares','4254855')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('20-33970087-8','José Manuel','Lavilla Garcia','Alvarado 2154','')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('20-31338234-7','Mariano Facundo','Geronimo','Caseros 2572','0387-4345673')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-31222929-9','Martin Ezequiel','Marchetti','Pje. Velarde 62 ','4223620')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('20-28260814-7','Marcos Santiago','Bravo','Lavalle 833','4230138')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-32543730-3','DAVID','ANDULCE','BARRIO LIMACHE ET 2 MZNA 5 CASA 22','38715444947')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-23118691-9','VIVIANA ELIZABETH','TINTE','PJE. METAN 2149 (ALTURA OLAVARRIA 750)','4341189')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('23-28261785-4','Natalia','Baracatt','Caseros Nº 1554','4229068')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-23316500-5','Andrea Veronica','Martinez Figueroa','Urquiza n° 190','154577624')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-34066175-9','Josefina','Arancibia Lemos','Mza. 816 B casa 9 Bº Ampl.Los Tarcos','0387 4611237')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-30235372-2','Valeria','Fiori','','')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-28260383-2','SILVINA PATRICIA','GALLARDO MARTINEZ','','')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-18396071-2','MARIA','NOGALEDO','','')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('20-27176111-3','Emanuel','Rodriguez Lauandos','','')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-35105195-2','María Pía','Molina','','')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-13346228-2','Amalia Susana','Aramayo Alesso','','')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-21633592-4','BETINA TERESITA','KUMIKE','','')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-13844632-3','ZULMA MERCEDES DEL VALLE','CENTENO','','')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('33-71097454-9','Juan José','Martinez','','')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('20-31173987-6','CINTIA TAMARA','NERIZ','Barrio Bancario - Block M 2 - 3 P B','')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-29693187-5','maria laura','sarmiento','','')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-22612944-3','PATRICIA NOEMI','POMARES','PASAJE SAN LORENZO 175','4217483')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-26030779-2','Teresa Inès del Valle','ARIAS','','')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('24-32165711-3','JOSE ANTONIO','MORILLO','','')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-30332358-4','SILVANA','VACA','','')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-16517700-8','SILVINA','RIVELLI','','')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-23079231-9','SILVINA ALICIA','LAJAD PERALTA','','')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('20-20284133-4','Conrado René','Padilla','','')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-29164814-8','SILVINA MARIEL','DELGADO','Radio Guarani Nº 2530 Bº Araoz','387-4137949')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('20-34311736-2','Pedro Pablo','Orozco','','')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-30420513-5','María Elena','Quinteros','','')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('20-35264642-4','angelica marta ramona','Lopez','','')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-24875352-3','Maria Jimena','Morales','','')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('20-39676038-0','Javier Agustin','Quiroga','','')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-40075138-8','Ana Rocio','Figueredo Rosales','','')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('23-39363463-4','Noemi','Lopez','','')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('20-37775139-7','JAVIER ALBERTO','SARAVIA','','')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('20-40330166-4','Mario Leonel','Villalba','','')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-38341278-7','Mariquena','Difrancesco','','')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-40330250-9','Paola Belen','Gallardo Guantay','','')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-36379440-3','Yamina','Mansilla','','')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-39401215-2','Florencia','Alanis','','')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-39040492-7','Eliana Sol','Diaz','','')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('20-32910502-5','Francisco Alejandro','Burgos Gutierrez','','')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-39893414-3','Maira','Tolaba Galean','','')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-40146973-2','Mariel','zaconeta','','')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('20-26167010-1','Ricardo Rodolfo','Almaraz ','','')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-30806679-2','Ana Laura','Lugones','Pje. Yapeyù Nº 1951','4223925')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-25218344-8','Mariela Jessica','Alberto','Laprida 770','4228255')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('20-21737853-3','Angel','Salto','','')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('20-31338197-9','Alejandro','Ramon','','')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('20-32804873-7','Facundo','Escudero','','')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('20-20707291-6','Claudio','Luna','Juan B. Justo 20','')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-29335708-6','ANA CECILIA','PALMA','13 de julio  - 21 - Portezuelo Norte','')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('20-32347795-8','Marcos Ramón','Miranda','Los Partidarios 1502','0387-4610580')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('23-31436990-4','Virginia Alicia','Tolaba','La Rioja 2003','4315141')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('20-35929735-2','Matias','Minetti','Mitre 257 1er Piso Dpto. 4','0387-4214029')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('20-35106774-9','Gabriel Rodolfo','Maiza Benavidez','Esteco 1162','')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('20-35309103-5','Alberto Ezequiel','Daud','Alvarado 845 1 piso dpto 7','4906241')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-28887094-8','Gastón Federico','Montali','Los Ciruelos Nº 82','(0387) 4395355')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-20609816-9','Sandra','Domene','','')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('23-40628129-9','Agustín Santiago','Ovejero','','')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('20-40525682-8','BRIAN AXEL','YAPURA','','')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('23-40764647-9','JOHANA AYELEN','LEDEZMA','','')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-40515839-1','Natalia ','Tolaba','','')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-39016869-7','María Priscila','Reynoso','','')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('20-40326493-9','Nicolas Gabriel','Aviles Zisner','','')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-40630747-1','ANA BELÉN','VICTORIA','','')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-40429984-6','ALDANA BELEN','ARAUJO','','')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('20-40525862-6','ROXANA BELÉN','BARRIENTOS','','')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-39783441-2','De los Angeles Milena ','Fabian','','')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('20-39783756-5','EZEQUIEL ','CHOQUE VARGAS MULLUCUNDO','','')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-36912766-2','SOFIA VIRGINIA','TEJADA','','')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-39536418-4','CARLA BELÉN','SOTO','','')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-41095432-5','KARINA','ZERPA','','')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('20-39890886-5','MARÍA DEL MILAGRO','TOIGO','','')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-31220372-9','MARCELA ANDREA DEL VALLE','NOLASCO ','','')
INSERT INTO EMPLEADO_TEMP (cuil,apellido,nombre,direccion,telefono) VALUES ('27-29590443-2','CRISTINA DEL VALLE','PLAZA NOELIA','','')

--(c) Cargar la planta de empleados utilizando inserciones masivas a partir de la tabla temporal EMPLEADO_TEMP
--i.insertar 10 de EMPLEADO_TEMP ordenados por cuil, indique todos son ‘Ayudante de Albañil’ y que fueron asignados a la obra el ‘25/07/2008’.
Insert into EMPLEADO (dni,cuil,nombre,apellido,direccion,telefono)
Select top 10 substring (cuil,4, LEN (cuil)-5),CUIL,nombre,apellido,direccion,telefono 
from EMPLEADO_TEMP
order by cuil asc
--ii.10 primeros registros de la tabla EMPLEADO_TEMP ordenados por cuil y teniendo en cuenta que no estén entre los ya ingresados en el punto anterior

--iii.Tabla EMPLEADO todos los empleados de la tabla EMPLEADO_TEMP que aún no hayan sido dados de alta.

--iv.Inserte 3 empleados uno de ellos debe ser Arquitecto, otro Plomero y otro Pintor

--(d) Dé de alta las siguientes obras
--i.Ingrese una obra llamada ‘Ampliación Tres Cerritos – Familia Cornejo’, se sabe que la obra es del tipo ‘casa’ y que el día de la fecha se le da inicio.
--Se asigna la ‘Aplanadora  VG201’, la ´Soldadora Alógena’, un arquitecto, 3 oficiales y 3 ayudantes.


--(2) sentencia para actualizar
--(a)Actualice la dirección del empleado cuyo dni es ‘32630115’ por ‘San Isidro 4587 Barrio San Francisco’.
update EMPLEADO_temp Set direccion='San Isidro 4587 Barrio San Francisco' where direccion='Isalas Malvinas 62'

--(b)Actualice el cuil del empleado ‘27-32630115-4’ por ‘27-32630115-5’. 
update EMPLEADO_temp set cuil='27-32630115-5' where cuil='27-32630115-4'

--(c)corrija este problema mediante una sentencia de actualización masiva


--(d)Elimine la dirección de todos los empleado cuyo apellido sea ‘Flores’
--checkeo si existe el apellido 'Flores' en los registros
select apellido 
from EMPLEADO_temp
where apellido = 'Flores'
--cambio los registros de los apellidos 'Flores'
update EMPLEADO_temp set direccion='' where apellido='Flores'

--(e)Actualice las direcciones de todos los empleados colocando el valor ‘Sin dirección’
update EMPLEADO_temp set direccion='Sin direccion' where direccion=''

--(3)sentencias de borrar
--•	Elimine el empleado cuyo cuil es ‘27-32630115-4’
delete from EMPLEADO_temp
where cuil = '27-32630115-4'

--•	Elimine los empleados cuyo apellido termine en ‘s’

--•	Elimine un conjunto de empleados cuyo apellido sea ‘Flores’ utilizando sub-consultas


--•	Elimine el tipo de obra ‘casa’. Indique que sucede y explique.
