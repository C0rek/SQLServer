--tp 07 Tomas Rodriguez Zoni
use bd2

--1.	Consulte el apellido y el apellido al revés de todos los empleados del dept_id = 90.-
select EMPLEADO_NOMBRE, REVERSE(EMPLEADO_APELLIDO)
from empleados
where DEPT_ID = 90

--2.	Consulte apellido y nombre ambos en mayúsculas, separados por ‘; ’ y calcule la longitud de esta unión. .-
select UPPER(CONCAT_WS(';',EMPLEADO_APELLIDO,EMPLEADO_NOMBRE)) as 'NyA', LEN(CONCAT_WS(';',EMPLEADO_APELLIDO,EMPLEADO_NOMBRE)) as LONGITUD
from empleados
where DEPT_ID = 90
--•	Modifique la consulta de modo que agregue 5 espacios luego del “;”. Use la función space.
select UPPER(CONCAT_WS(';',EMPLEADO_APELLIDO,space(5),EMPLEADO_NOMBRE)) as 'NyA', LEN(CONCAT_WS(';',EMPLEADO_APELLIDO,EMPLEADO_NOMBRE)) as LONGITUD
from empleados
where DEPT_ID = 90

--3.	Consulte para todos los empleados apellido y las tres primeras letras de su nombre, separe con un guion medio, todo en minúsculas. 
select LOWER(CONCAT_WS('-', EMPLEADO_APELLIDO, SUBSTRING(EMPLEADO_NOMBRE,1,3))) as MINUS
from empleados

--4.	Escriba una consulta que muestre los nombre de los empleados con la primera letra en mayúsculas y todas las demás en minúsculas, 
--	así como la longitud de los nombres, para todos los empleados cuyos nombres comienzan con  J, A o M. Asigne a cada columna la etiqueta 
--	correspondiente. Ordene los resultados según los nombres de los empleados
select UPPER(SUBSTRING(EMPLEADO_APELLIDO,1,1)) + LOWER(SUBSTRING(EMPLEADO_APELLIDO,2,10)) as APELLIDOS, EMPLEADO_NOMBRE as NOMBRES, LEN(EMPLEADO_APELLIDO + EMPLEADO_NOMBRE) as LONGITUD 
from empleados
where EMPLEADO_APELLIDO like 'A%' or EMPLEADO_APELLIDO like 'J%' or EMPLEADO_APELLIDO like 'M%'
order by EMPLEADO_NOMBRE asc

--5.	Escriba una consulta que devuelva en mayúsculas, para todos los departamentos que tienen manager  las tres primeras letras del 
--	departamento  y el apellido del Manager de ese departamento.-
select UPPER(SUBSTRING(d.DEPT_NOM,1,3) + '-' + e.EMPLEADO_APELLIDO)
from departamentos as d
inner join empleados as e
on e.manager_id=d.manager_id
where d.MANAGER_ID is not null

--6.	Se necesita para todos los empleados, código de cargo (trabajo_id) con una longitud fija de 20 caracteres, 
--	rellene a la derecha con espacios y el código de empleado (empleado_id) con una longitud fija de 10 caracteres rellene ‘0’ a la izquierda.-
select TRABAJO_ID + SPACE(10) as 'CODIGO_CARGO', RIGHT('0000000000'+ CAST(EMPLEADO_ID AS VARCHAR(10)),10) as CODIGO_EMPLEADO
from empleados

--7.	Escriba una consulta para mostrar la fecha actual. Etiquete la columna como Fecha.-
select CURRENT_TIMESTAMP as FECHA_TIMESTAMP , GETDATE() FECHA_GETDATE

--8.	Escriba una consulta que devuelva Apellido, dia, mes y año de contratación de todos los empleados contratados en 1994.-
select EMPLEADO_APELLIDO as NOMBRE, day(EMPLEADO_FECING) as DIA, MONTH(EMPLEADO_FECING) as MES, YEAR(EMPLEADO_FECING) as AÑO 
from empleados
where YEAR(EMPLEADO_FECING) ='1994'

--9.	Para cada empleado, visualice su número, apellido, salario y salario incrementado en el 15 % y expresado como número entero. Etiquete la columna como “New Salary”
select EMPLEADO_ID, EMPLEADO_APELLIDO as 'LAST_NAME',EMPLEADO_SALARIO as 'SALARY' , (EMPLEADO_SALARIO*1.15) as 'NEW SALARY'
from empleados

--10.	Para todos los empleados seleccione apellido, sueldo y el impuesto que paga. Ordene en forma descendente según valor de impuesto
select EMPLEADO_APELLIDO, EMPLEADO_SALARIO, 
CASE
	WHEN EMPLEADO_SALARIO < 4000 then (EMPLEADO_SALARIO * 1.1) - EMPLEADO_SALARIO
	WHEN EMPLEADO_SALARIO > 4000 and EMPLEADO_SALARIO < 8000 then (EMPLEADO_SALARIO * 1.2) - EMPLEADO_SALARIO
	ELSE (EMPLEADO_SALARIO*1.30) - EMPLEADO_SALARIO
end as IMPUESTO
from empleados
order by IMPUESTO desc

--11.	De la tabla localidades, remplace del campo loc_dir, Rd por Road y Blvd por Boulevard
UPDATE localidades set LOC_DIR = REPLACE(LOC_DIR, 'Rd','Road')
UPDATE localidades set LOC_DIR = REPLACE(LOC_DIR, 'Blvd','Boulevard')
select loc_dir as Direccion from localidades

--12.	De la tabla trabajos, agregar luego de la palabra ‘de’ la palabra ‘l departamento’ del campo job_nombre.  
--Puede hacerse de dos formas usando diferentes funciones?
UPDATE trabajos set TRABAJO_NOMBRE = REPLACE(TRABAJO_NOMBRE, 'de', 'del departamento')
select trabajo_nombre from trabajos
