use bd2
--obtener un DER de la base de datos (DATABASE DIAGRAMS)

--sp_help --> visualizo la estructura de cada una de las tablas

--indico el grado de cada una de las tablas 

--indico la cardinalidad de cada una de las tablas
select count(*) from departamentos

--indique el dominio de los atributos trabajo_id de empleados y pais_id de localidades
--sp_help EMPLEADOS
--sp_help LOCALIDADES

--(1)muestro apellido, codigo de cargo y numero de empleado
select EMPLEADO_APELLIDO, EMPLEADO_ID, TRABAJO_ID  
from empleados

--(2)coloco un alias a la columna anterior
select EMPLEADO_APELLIDO'Apellido', EMPLEADO_ID'ID Empleado', TRABAJO_ID'ID Trabajo'  
from empleados

--(3)mostrar codigo de cargos unicos de la tabla empleado
select distinct TRABAJO_ID
from empleados

--(4)mostrar apellido concatenado al id_cargo separado por ; con el alias "Empleado y cargo"
select EMPLEADO_APELLIDO + ' ; ' + TRABAJO_ID 'Empleado y cargo'
from empleados

--(5)mostrar apellido y empleados que ganan mas de 12000
select EMPLEADO_APELLIDO, EMPLEADO_SALARIO 
from empleados
where EMPLEADO_SALARIO > 12000

--(6)mostrar apellido empleado con el numero de departamento para  el empleado 176
select EMPLEADO_APELLIDO, DEPT_ID, EMPLEADO_ID 
from empleados
where EMPLEADO_ID = 176

--(7)mostrar apellido y salario <5000 y >12000
select EMPLEADO_APELLIDO, EMPLEADO_SALARIO
from empleados
where EMPLEADO_SALARIO not between 5000 and 12000

--(8)mostrar apellido trabajo_id y entre fecha 20 de febrero de 1998 y el 01 de mayo de 1998
select EMPLEADO_APELLIDO, TRABAJO_ID, EMPLEADO_FECING 
from empleados
where EMPLEADO_FECING between '1998/02/20' and '1998/05/01'
order by EMPLEADO_FECING desc

--(9)mostrar apellido y numero de departamentos 20 y 50 alfabetico apellidos
select EMPLEADO_APELLIDO, DEPT_ID
from empleados
where DEPT_ID = 20 or DEPT_ID = 50

--(10)punto 7 ganan entre 5000 y 12000 dept_id = 20 o dept_id = 50 y columnas como 'empleados' y 'salario mensual'
select EMPLEADO_APELLIDO'empleados', EMPLEADO_SALARIO'EMPLEADO_SALARIO' 
from empleados
where (DEPT_ID = 20 or DEPT_ID = 50) and EMPLEADO_SALARIO between 5000 and 12000

--(11)mostrar apellido con fecha contratacion de 1994
select EMPLEADO_APELLIDO, EMPLEADO_FECING 
from empleados
where EMPLEADO_FECING between '1994/01/01' and '1994/12/31'
--where year(EMPLEADO_FECING) = 1994	costoso para grandes tablas

--(12)mostrar apellido y null de manager
select EMPLEADO_APELLIDO, coalesce(MANAGER_ID,0)	--devuelve el null como 0
from empleados

--(13)mostrar apellido, salario y comision para los que ganan comision. Ordenar desce de salario y comisiones
select EMPLEADO_APELLIDO, EMPLEADO_SALARIO, COMMISSION_PCT
from empleados
where COMMISSION_PCT <> ''			-- distinto de vacio
order by EMPLEADO_SALARIO, COMMISSION_PCT asc 